import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/sibsp_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


// TextEditingController _ageController;

Widget SibspTextFormField({required BuildContext context}){
  return Form(
    key: context.read<SibSpTextNotifier>().sibspFormKey,
    child: TextFormField(
      controller: context.watch<SibSpTextNotifier>().sibspController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: "Total no. of sbsp ",
        labelText: "Total Sibsp Member",
        //errorText: context.watch<FamilyTextNotifier>().familyErrorText,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.family_restroom),
        errorStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),

      onChanged: (String? fd){
        context.read<SibSpTextNotifier>().sibspFormKey.currentState?.validate();
      },
      onFieldSubmitted: (String? str){
        context.read<SibSpTextNotifier>().sibspFormKey.currentState?.validate();
      },
      validator: (String? value){
        if(value == null || value.isEmpty) {
          return 'please enter your Sibsp number';
        }else{
          int val = int.parse(value);
          if (val <0) {
            return "you should enter your lowest age as 0";
          } else if((val > 10)){
            return "you should enter your highest as 10";;
          }else{
            return null;
          }
        }
        }

    ),
  );
}