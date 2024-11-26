import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Controller/parch_notifier.dart';


// TextEditingController _ageController;

Widget ParchTextFormField({required BuildContext context}){
  return Form(
    key: context.read<ParchTextNotifier>().parchFormKey,
    child: TextFormField(
      controller: context.watch<ParchTextNotifier>().parchController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: "Total no. of Parent or Child ",
        labelText: "Total Parch Member",
        //errorText: context.watch<FamilyTextNotifier>().familyErrorText,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.family_restroom),
        errorStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),

      onChanged: (String? fd){
        context.read<ParchTextNotifier>().parchFormKey.currentState?.validate();
      },
      onFieldSubmitted: (String? str){
        context.read<ParchTextNotifier>().parchFormKey.currentState?.validate();
      },
      validator: (String? value){
        if(value == null || value.isEmpty) {
          return 'please enter your Sibsp number';
        }else{
          int val = int.parse(value);
          if (val <0) {
            return "you should enter your lowest age as 0";
          } else if((val > 10)){
            return "you should enter your highest as 10";
          }else{
            return null;
          }
        }
        }

    ),
  );
}