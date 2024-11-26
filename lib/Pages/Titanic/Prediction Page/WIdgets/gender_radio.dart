import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/Base WIdget/glass_effect_container.dart';
import '../Controller/gender_radio_notifier.dart';

Widget RadioFrGender({required BuildContext context, required List<String> genderList}){
  String male = genderList[0];
  String female = genderList[1];

  return
      Container(
              child: Row(
                  children: [
                    Text("Select Gender : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                    SizedBox(width: 15.w,),
                    RadioMF(context: context,valueText: male),
                    SizedBox(width: 10.w,),
                    RadioMF(context: context,valueText: female),
                  ]
              )
  );
}

Widget RadioMF({required BuildContext context, required String valueText}){
  return GlassEffectContainer(
      child: Row(
        children: [
          Radio(
              value: valueText,
              groupValue: context.watch<GenderRdNotifier>().selectGender,
              onChanged: (value){
                context.read<GenderRdNotifier>().setGender = value!;
                print(context.read<GenderRdNotifier>().selectGender);
              }),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Text("${valueText}", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
          ),

        ],
      ));

}