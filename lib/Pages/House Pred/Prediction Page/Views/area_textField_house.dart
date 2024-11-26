import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Controller/area_house_notifier.dart';


Widget AreaHouseTextFormField({required BuildContext context}){
  return Form(
    key: context.read<AreaHouseNotifier>().areaFormKey,
    child: TextFormField(
      controller: context.watch<AreaHouseNotifier>().areaController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        hintText: "Total Area",
        labelText: "Area",
        //errorText: context.watch<AgeTextNotifier>().ageErrorText,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        errorStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),

      onChanged: (String? fd){
        context.read<AreaHouseNotifier>().areaFormKey.currentState?.validate();
      },
      onFieldSubmitted: (String? str){
        context.read<AreaHouseNotifier>().areaFormKey.currentState?.validate();
      },
      validator: (String? value){
        if(value == null || value.isEmpty) {
          return 'please enter your total area';
        }else {
          int val = int.parse(value);
          if (val <1) {
            return "you should enter your lowest area as 100";
          } else{
            return null;
          }
        }
      },
    ),
  );
}