import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/age_text_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/fare_text_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


// TextEditingController _ageController;

Widget FareTextFormField({required BuildContext context}){
  return Form(
    key: context.read<FareTextNotifier>().fareFormKey,
    child: TextFormField(
      controller: context.watch<FareTextNotifier>().fareController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: "Enter Your Fare Amount",
        labelText: "Enter Your Fare",
       // errorText: context.watch<FareTextNotifier>().fareErrorText,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.money),
        errorStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),

      onChanged: (String? fd){
        context.read<FareTextNotifier>().fareFormKey.currentState?.validate();
      },
      onFieldSubmitted: (String? str){
        context.read<FareTextNotifier>().fareFormKey.currentState?.validate();
      },
      validator: (String? value){
        if(value == null || value.isEmpty) {
          return 'please enter your Fare';
        }else {
          int val = int.parse(value);
          if (val <1) {
            return "you should enter your lowest age as 1";
          } else if((val > 3000)){
            return "you should enter your highest as 3000";;
          }else{
            return null;
          }
        }
      },
    ),
  );
}