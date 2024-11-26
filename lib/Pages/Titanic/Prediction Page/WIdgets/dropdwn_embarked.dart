import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/dropdwn_pclass_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Controller/dropdwn_cabin_notifier.dart';
import '../Controller/dropdwn_embarked_notifier.dart';

Widget Drpdwn({required BuildContext context, required String selectOption, required String ntfType}){
  return Container(
    width: 150.h,
    child: InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0.r)),
        contentPadding: const EdgeInsets.all(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            iconEnabledColor: Colors.blueAccent,
            dropdownColor: Colors.blueGrey,
            isDense: true,
            value: ntfType=='embark'?context.read<EmbarkedDrpDnNotifier>().defaultFeature:
                    ntfType=='cabin'?context.read<CabinDrpDnNotifier>().defaultFeature:
                    ntfType=='pclass'?context.read<PclassDrpDnNotifier>().defaultFeature:
                    context.read<PclassDrpDnNotifier>().defaultFeature,

            isExpanded: true,
            menuMaxHeight: 350,
            items: [
              DropdownMenuItem(
                  child: Text(
                    "${selectOption}",
                  ),
                  value: ""),
              // for Embarked Dropdown
              ...ntfType=='embark'?context.watch<EmbarkedDrpDnNotifier>().dropDownListData.map<DropdownMenuItem<String>>((data) {
                return DropdownMenuItem(
                    child: Text(data['title']), value: data['value']);
              }).toList():

              // for Cabin Dropdown
              ntfType=='cabin'?context.watch<CabinDrpDnNotifier>().dropDownListData.map<DropdownMenuItem<String>>((data) {
                return DropdownMenuItem(
                    child: Text(data['title']), value: data['value']);
              }).toList():

              // for Pclass Dropdown

              context.watch<PclassDrpDnNotifier>().dropDownListData.map<DropdownMenuItem<String>>((data) {return DropdownMenuItem(
                  child: Text(data['title']), value: data['value']);
              }).toList(),
            ],
            onChanged: (value) {

              ntfType=='embark'?context.read<EmbarkedDrpDnNotifier>().setFeature = value!:
              ntfType=='cabin'?context.read<CabinDrpDnNotifier>().setFeature = value!:
              context.read<PclassDrpDnNotifier>().setFeature = value!;


              // context.read<EmbarkedDrpDnNotifier>().setEmbark = value!;
              print("selected Value $value");
            }),
      ),
    ),
  );
}