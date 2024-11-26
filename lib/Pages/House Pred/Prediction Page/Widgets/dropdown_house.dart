import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Controller/bathrooms_house_notifier.dart';
import '../Controller/bedrooms_house_notifier.dart';
import '../Controller/furnishStatus_houe_notifier.dart';



Widget DrpdwnHouse({required BuildContext context, required String selectOption, required String ntfType}){
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
            value: ntfType=='bedrooms'?context.read<BedroomsHouseNotifier>().defaultFeature:
            ntfType=='bathrooms'?context.read<BathroomsHouseNotifier>().defaultFeature:
            context.read<furnishStatuts_notifier>().defaultFeature,

            isExpanded: true,
            menuMaxHeight: 350,
            items: [
              DropdownMenuItem(
                  child: Text(
                    "${selectOption}",
                  ),
                  value: ""),
              // for Embarked Dropdown
              ...ntfType=='bedrooms'?context.watch<BedroomsHouseNotifier>().dropDownListData.map<DropdownMenuItem<String>>((data) {
                return DropdownMenuItem(
                    child: Text(data['title']), value: data['value']);
              }).toList():

              // for Cabin Dropdown
              ntfType=='bathrooms'?context.watch<BathroomsHouseNotifier>().dropDownListData.map<DropdownMenuItem<String>>((data) {
                return DropdownMenuItem(
                    child: Text(data['title']), value: data['value']);
              }).toList():

              // for Pclass Dropdown

              context.watch<furnishStatuts_notifier>().dropDownListData.map<DropdownMenuItem<String>>((data) {return DropdownMenuItem(
                  child: Text(data['title']), value: data['value']);
              }).toList(),
            ],
            onChanged: (value) {

              ntfType=='bedrooms'?context.read<BedroomsHouseNotifier>().setFeature = value!:
              ntfType=='bathrooms'?context.read<BathroomsHouseNotifier>().setFeature = value!:
              context.read<furnishStatuts_notifier>().setFeature = value!;


              // context.read<EmbarkedDrpDnNotifier>().setEmbark = value!;
              print("selected Value $value");
            }),
      ),
    ),
  );
}