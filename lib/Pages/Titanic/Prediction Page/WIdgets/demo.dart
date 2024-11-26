// import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/age_text_notifier.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
//
//
//
//
// Widget AgeTextFormField({required BuildContext context, required GlobalKey ageGlobalKey, required TextEditingController ageController, required String ageErrorText, required FormFieldValidator ageValidator}){
//   return Form(
//     key: ageGlobalKey,
//     child: TextFormField(
//       controller: ageController,
//       maxLines: 1,
//       keyboardType: TextInputType.number,
//       inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
//       decoration: InputDecoration(
//         hintText: "Enter Your Age",
//         labelText: "Enter Your Age",
//         errorText: ageErrorText,
//         labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
//         border: const OutlineInputBorder(),
//         prefixIcon: const Icon(Icons.person),
//         errorStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
//       ),
//
//       // onChanged: (String? fd){
//       //   ageGlobalKey.currentState?.validate();
//       // },
//       // onFieldSubmitted: (String? str){
//       //   ageGlobalKey.currentState?.validate();
//       // },
//       validator: ageValidator,
//       // validator: (String? value){
//       //   if(value == null || value.isEmpty) {
//       //     return 'please enter your age';
//       //   }else {
//       //     int val = int.parse(value);
//       //     if (val <1) {
//       //       return "you should enter your lowest age as 1";
//       //     } else if((val > 91)){
//       //       return "you should enter your highest as 90";;
//       //     }else{
//       //       return null;
//       //     }
//       //   }
//       // },
//     ),
//   );
// }