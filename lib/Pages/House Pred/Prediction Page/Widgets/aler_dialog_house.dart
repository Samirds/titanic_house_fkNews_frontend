import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showAlertDialog(BuildContext context) async{
  return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          //backgroundColor: Colors.grey,
          elevation: 3.h,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          title: Text("Please Select all options"),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
        
      });
}