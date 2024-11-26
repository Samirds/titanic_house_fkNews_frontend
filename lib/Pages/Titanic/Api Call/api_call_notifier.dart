import 'dart:convert';

import 'package:ai_with_flutter/Pages/Titanic/Api%20Call/pred_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

import '../Prediction Page/Controller/age_text_notifier.dart';
import '../Prediction Page/Controller/dropdwn_cabin_notifier.dart';
import '../Prediction Page/Controller/dropdwn_embarked_notifier.dart';
import '../Prediction Page/Controller/dropdwn_pclass_notifier.dart';
import '../Prediction Page/Controller/fare_text_notifier.dart';
import '../Prediction Page/Controller/gender_radio_notifier.dart';
import '../Prediction Page/Controller/parch_notifier.dart';
import '../Prediction Page/Controller/sibsp_notifier.dart';

class ApiCallNotifier with ChangeNotifier{


  var url = "http://10.0.2.2:8000/project/appT/";
  bool isloading = true;
  bool repotCardShow = false;
  String predResult = "";
  Color predColor = Colors.blueGrey;


  set setPredResult(String value){
    predResult = value;
    notifyListeners();
  }

  set setCrclPIndicator(bool value){
    isloading = value;
    notifyListeners();
  }

  set setPredColor(Color value){
    predColor = value;
    notifyListeners();
  }

  set setShowReportCard(bool value){
    repotCardShow = value;
    notifyListeners();
  }





  predict(BuildContext context) async {

    TitanicData titanicData = TitanicData(
      age: int.parse(context.read<AgeTextNotifier>().ageController.text),
      gender: context.read<GenderRdNotifier>().selectGender,
      fare: int.parse(context.read<FareTextNotifier>().fareController.text),
      pclass: int.parse(context.read<PclassDrpDnNotifier>().defaultFeature),
      embarked: context.read<EmbarkedDrpDnNotifier>().defaultFeature,
      cabin: context.read<CabinDrpDnNotifier>().defaultFeature,
      sbsp: int.parse(context.read<SibSpTextNotifier>().sibspController.text),
      parch: int.parse(context.read<ParchTextNotifier>().parchController.text),
    );

    var titanic_json_data = json.encode(titanicData.toJson());

    try{
      Response response = await http.post(
          Uri.parse(url),
          body: titanic_json_data,
          headers: {
            "Content-Type": "application/json",
          }
      );
      var resData = jsonDecode(response.body);
      print("\n\nresponse is --- ${resData}");
      print("\n\nresponse is --- ${response.statusCode}");

      var pre = Predict.fromJson(resData);

      if(response.statusCode == 200){
        setCrclPIndicator = false;

        if(pre.result == 0){
          setPredResult = "Dead";
          setPredColor = Colors.red;
        }else{
          setPredResult = "Alive";
          setPredColor = Colors.green;
        }
      }else{
        print("status code is not 200");
      }

      print("age is ${pre.titanicData?.age}");

    }catch(e){
      print("Server is not Running");
      print(e.toString());
    }


  }

}

