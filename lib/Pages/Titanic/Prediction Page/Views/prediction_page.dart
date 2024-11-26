import 'dart:convert';

import 'package:ai_with_flutter/Pages/Titanic/Api%20Call/api_call_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Api%20Call/pred_model.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/age_text_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/dropdwn_cabin_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/dropdwn_embarked_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/gender_radio_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/sibsp_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/fare_text_notifier.dart';
import 'package:ai_with_flutter/common/Utils/app_string.dart';
import 'package:ai_with_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../../../common/Base WIdget/glass_effect_container.dart';
import '../Controller/dropdwn_pclass_notifier.dart';
import '../Controller/parch_notifier.dart';
import '../WIdgets/age_text_field.dart';
import '../WIdgets/dropdwn_embarked.dart';
import '../WIdgets/parch_text_field.dart';
import '../WIdgets/sibsp_text_field.dart';
import '../WIdgets/fare_text_field.dart';
import '../WIdgets/gender_radio.dart';
import '../WIdgets/reprot_cart.dart';
import 'package:http/http.dart' as http;

class PredictionPageT extends StatefulWidget {
  PredictionPageT({super.key});

  @override
  State<PredictionPageT> createState() => _PredictionPageTState();
}

class _PredictionPageTState extends State<PredictionPageT> {

  List<String> genderList = ["Male", "Female"];

  // _predict() async {
  //   TitanicData titanicData = TitanicData(
  //     age: int.parse(context.read<AgeTextNotifier>().ageController.text),
  //     gender: context.read<GenderRdNotifier>().selectGender,
  //     fare: int.parse(context.read<FareTextNotifier>().fareController.text),
  //     pclass: int.parse(context.read<PclassDrpDnNotifier>().defaultFeature),
  //     embarked: context.read<EmbarkedDrpDnNotifier>().defaultFeature,
  //     cabin: context.read<CabinDrpDnNotifier>().defaultFeature,
  //     sbsp: int.parse(context.read<SibSpTextNotifier>().sibspController.text),
  //     parch: int.parse(context.read<ParchTextNotifier>().parchController.text),
  //   );
  //
  //
  //   var url = "http://10.0.2.2:8000/project/appT/";
  //   var json_data = json.encode(titanicData.toJson());
  // try{
  //   Response response = await http.post(
  //       Uri.parse(url),
  //       body: json_data,
  //       headers: {
  //         "Content-Type": "application/json",
  //       }
  //   );
  //   var resData = jsonDecode(response.body);
  //   print("\n\nresponse is --- ${resData}");
  //   print("\n\nresponse is --- ${response.statusCode}");
  //
  // }catch(e){
  //   print("hello");
  //   print(e.toString());
  // }
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // this line is for keyboard to dismiss to torch on Screen
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // -----------------this s for image part----------------------------------
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.blueGrey,
              expandedHeight: 200.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/ship_sinking.png",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1.h),
                  child: Container(
                      color: Colors.blueGrey,
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                        "${AppText.Tname}",
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )))),
            ),
            SliverToBoxAdapter(
              child: GlassEffectContainer(
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      RadioFrGender(context: context, genderList: genderList),
                      SizedBox(
                        height: 5.h,
                      ),

                      //--------------------------------------Embarked----------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Embarked : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 75.w,
                          ),
                          Drpdwn(
                              context: context,
                              selectOption: 'Select Location',
                              ntfType: 'embark'),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      //--------------------------------------Cabin----------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Cabin : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Drpdwn(
                              context: context,
                              selectOption: 'Select Cabin',
                              ntfType: 'cabin'),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      //--------------------------------------P CLass----------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select PClass : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Drpdwn(
                              context: context,
                              selectOption: 'Select PClass',
                              ntfType: 'pclass'),
                        ],
                      ),
                      SizedBox(height: 5.h),

                      AgeTextFormField(context: context),
                      SizedBox(height: 15.h,),

                      FareTextFormField(context: context),
                      SizedBox(height: 15.h,),

                      SibspTextFormField(context: context),
                      SizedBox(height: 15.h,),

                      ParchTextFormField(context: context),
                      SizedBox(height: 15.h,),

                      context.watch<ApiCallNotifier>().repotCardShow?
                      context.watch<ApiCallNotifier>().isloading?CircularProgressIndicator():ReprotCart()
                      :SizedBox(height: 1.w,),


                      //context.watch<ApiCallNotifier>().isloading?CircularProgressIndicator():ReprotCart(),
                      SizedBox(
                        height: 5.h,
                      ),

                      //Btn
                      GestureDetector(
                        onTap: () {
                          if (context.read<AgeTextNotifier>().ageFormKey.currentState!.validate() &&
                              context.read<FareTextNotifier>().fareFormKey.currentState!.validate() &&
                              context.read<SibSpTextNotifier>().sibspFormKey.currentState!.validate() &&
                              context.read<ParchTextNotifier>().parchFormKey.currentState!.validate()){



                            context.read<ApiCallNotifier>().setShowReportCard = true;
                            // Calling the function for api call
                            context.read<ApiCallNotifier>().predict(context);


                            print("Total value is ->");
                          }else{
                            print("not okey");
                          };

                        },
                        child: Container(
                          height: 30,
                          //width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blueAccent.withOpacity(0.5),
                                    Colors.white.withOpacity(0.1)
                                  ])),
                          child: Center(
                            child: Text("Let's Predict",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w400)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
