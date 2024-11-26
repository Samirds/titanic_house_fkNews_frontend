import 'dart:convert';

import 'package:ai_with_flutter/Pages/House%20Pred/Api%20Call/pred_model_house.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/area_house_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/bedrooms_house_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/y_n_radio_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

import '../Prediction Page/Controller/bathrooms_house_notifier.dart';
import '../Prediction Page/Controller/furnishStatus_houe_notifier.dart';



class ApiCallHouseNotifier with ChangeNotifier{


  var url = "http://10.0.2.2:8000/project/appH/";
  bool isloading = true;
  bool repotCardShow = false;
  late var predResult ;


  set setPredResult(String value){
    predResult = value;
    notifyListeners();
  }

  set setCrclPIndicator(bool value){
    isloading = value;
    notifyListeners();
  }

  set setShowReportCard(bool value){
    repotCardShow = value;
    notifyListeners();
  }



  Map<dynamic, dynamic> DataProcess(BuildContext context){
    int area = int.parse(context.read<AreaHouseNotifier>().areaController.text);
    int bedrooms = int.parse(context.read<BedroomsHouseNotifier>().defaultFeature);
    int bathrooms = int.parse(context.read<BathroomsHouseNotifier>().defaultFeature);
    int stories = int.parse(context.read<YNRadioNotifier>().defaultMS);
    int mainroad = int.parse(context.read<YNRadioNotifier>().defaultMR);
    int guestroom = int.parse(context.read<YNRadioNotifier>().defaultGR);
    int basement = int.parse(context.read<YNRadioNotifier>().defaultBM);
    int parking = int.parse(context.read<YNRadioNotifier>().defaultPK);
    int prefarea = int.parse(context.read<YNRadioNotifier>().defaultPF);
    int luxury_item = int.parse(context.read<YNRadioNotifier>().defaultLX);
    int furnishingstatus = int.parse(context.read<furnishStatuts_notifier>().defaultFeature);

    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    data["area"] = area;
    data["bedrooms"] = bedrooms;
    data["bathrooms"] = bathrooms;
    data["stories"] = stories;
    data["mainroad"] = mainroad;
    data["guestrooms"] = guestroom;
    data["basement"] = basement;
    data["parking"] = parking;
    data["prefarea"] = prefarea;
    data["luxury_item"] = luxury_item;
    data["furnishingstatus"] = furnishingstatus;

    return data;
  }





  predict(BuildContext context) async {
    Map<dynamic, dynamic> data = DataProcess(context);

    HouseData houseData = HouseData(
      area: data["area"],
      bedrooms: data["bedrooms"],
      bathrooms: data["bathrooms"],
      stories: data["stories"],
      mainroad: data["mainroad"],
      guestroom: data["guestrooms"],
      basement: data["basement"],
      parking: data["parking"],
      prefarea: data["prefarea"],
      luxuryItem: data["luxury_item"],
      furnishingstatus: data["furnishingstatus"]
    );

    var house_json_data = json.encode(houseData.toJson());

    try{
      Response response = await http.post(
          Uri.parse(url),
          body: house_json_data,
          headers: {
            "Content-Type": "application/json",
          }
      );
      var resData = jsonDecode(response.body);
      print("\nresponse body is --- ${resData}");
      print("\nstatus code is --- ${response.statusCode}");




      if(response.statusCode == 200){
        setCrclPIndicator = false;
        var pre = PredictionHouse.fromJson(resData);
        predResult = pre.result;
        // setShowReportCard = true;
        print("predicted value is ${predResult}");
      }else{
        print("status code is not 200");
      }

    }catch(e){
      print(" Catch part is running");
      print(e.toString());
    }


  }

}

