import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/Base WIdget/glass_effect_container.dart';

import '../Controller/y_n_radio_notifier.dart';


Widget RadioFrYN({required BuildContext context, required String feature, required String featureType}){
  String yes = "2";
  String no = "1";

  return
    Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${feature} avail.. : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RadioYN(context: context,valueText: yes,label: "Yes", featureType: featureType),
                SizedBox(width: 10.w,),
                RadioYN(context: context,valueText: no, label: "No", featureType: featureType),
                ],)

            ]
        )
    );
}

Widget RadioYN({required BuildContext context, required String valueText, required String label, required String featureType}){
  return GlassEffectContainer(
      child: Row(
        children: [
          Radio(
              value: valueText,
              groupValue: featureType == "mainroad"?context.watch<YNRadioNotifier>().defaultMR:
                  featureType =="multistore"? context.watch<YNRadioNotifier>().defaultMS:
                  featureType =="guestroom"? context.watch<YNRadioNotifier>().defaultGR:
                  featureType =="basement"? context.watch<YNRadioNotifier>().defaultBM:
                  featureType =="luxury"? context.watch<YNRadioNotifier>().defaultLX:
                  featureType =="park"? context.watch<YNRadioNotifier>().defaultPK:
                  context.watch<YNRadioNotifier>().defaultPF,

              onChanged: (value){

                featureType == "mainroad"?context.read<YNRadioNotifier>().setYesNoValueMainRoad = value!:
                featureType =="multistore"? context.read<YNRadioNotifier>().setYesNoValueMltstory = value!:
                featureType =="guestroom"? context.read<YNRadioNotifier>().setYesNoValueGstRooms = value!:
                featureType =="basement"? context.read<YNRadioNotifier>().setYesNoValueBasement = value!:
                featureType =="luxury"? context.read<YNRadioNotifier>().setYesNoValueLuxury = value!:
                featureType =="park"? context.read<YNRadioNotifier>().setYesNoValuePark = value!:
                context.read<YNRadioNotifier>().setYesNoValuePfarea = value!;


                // context.read<YesNoRadioNotifier>().setYesNoValue = value!;
                // print(context.read<YesNoRadioNotifier>().selectYNValue);
              }),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Text("${label}", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
          ),

        ],
      ));

}