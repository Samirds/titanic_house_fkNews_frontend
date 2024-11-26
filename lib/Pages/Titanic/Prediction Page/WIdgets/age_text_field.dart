import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/age_text_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


Widget AgeTextFormField({required BuildContext context}){
  return Form(
    key: context.read<AgeTextNotifier>().ageFormKey,
    child: TextFormField(
      controller: context.watch<AgeTextNotifier>().ageController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        hintText: "Enter Your Age",
        labelText: "Enter Your Age",
        //errorText: context.watch<AgeTextNotifier>().ageErrorText,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        errorStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),

      onChanged: (String? fd){
        context.read<AgeTextNotifier>().ageFormKey.currentState?.validate();
      },
      onFieldSubmitted: (String? str){
        context.read<AgeTextNotifier>().ageFormKey.currentState?.validate();
      },
      validator: (String? value){
        if(value == null || value.isEmpty) {
          return 'please enter your age';
        }else {
          int val = int.parse(value);
          if (val <1) {
            return "you should enter your lowest age as 1";
          } else if((val > 91)){
            return "you should enter your highest as 90";;
          }else{
            return null;
          }
        }
      },
    ),
  );
}