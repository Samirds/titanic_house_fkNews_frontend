import 'package:ai_with_flutter/Pages/Titanic/Api%20Call/api_call_notifier.dart';
import 'package:ai_with_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Controller/age_text_notifier.dart';
import '../Controller/dropdwn_cabin_notifier.dart';
import '../Controller/dropdwn_embarked_notifier.dart';
import '../Controller/dropdwn_pclass_notifier.dart';
import '../Controller/fare_text_notifier.dart';
import '../Controller/gender_radio_notifier.dart';

class ReprotCart extends StatelessWidget {
  const ReprotCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 350,
      child: Card(
        margin: EdgeInsets.all(8.0.w),
        elevation: 10,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      width: 65.w,
                      height: 65.h,
                      child: Image(image: AssetImage("assets/icons/ship_accident.png"),),
                    ),
                  ),

                  Container(
                      height: 65.h,
                      width: 250.w,
                      child: Center(child: Text("Your Complete Info", style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500
                      ),))),

                  SizedBox(width: 10.w,),

                  ClipOval(
                    child: Container(
                      color: context.watch<ApiCallNotifier>().predColor,
                      width: 15,
                      height: 15,
                    ),
                  )
                ],
              ),
            ),
            Divider(color: Colors.white60, thickness: 1,),

            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.w,),
                      Text("Fare is : ${context.read<FareTextNotifier>().fareController.text}",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10.w,),
                      Text("Age is : ${context.read<AgeTextNotifier>().ageController.text}",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10.w,),
                      Text("Gender : ${context.read<GenderRdNotifier>().selectGender}",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10.w,),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.w,),
                      Text("Cabin is: ${context.read<CabinDrpDnNotifier>().defaultFeature}",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10.w,),
                      Text("Embarked From : ${context.read<EmbarkedDrpDnNotifier>().defaultFeature}",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10.w,),
                      Text("PClass is : ${context.read<PclassDrpDnNotifier>().defaultFeature}",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),

                    ],
                  )
                ],
              ),
            ),


            Divider(color: Colors.white60, thickness: 1,),



            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(child: Text("Your are ${
              context.watch<ApiCallNotifier>().predResult

              } !",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500))),
            ),

            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(child: Text("Prediction is 82% Accurate",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500))),
            ),

          ],
        ),
      ),
    );
  }
}
