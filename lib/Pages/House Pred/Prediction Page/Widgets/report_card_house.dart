import 'package:ai_with_flutter/Pages/House%20Pred/Api%20Call/api_call_house_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



class ReprotCartHouse extends StatelessWidget {
  const ReprotCartHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 250,
      child: Card(
        margin: EdgeInsets.all(8.0.w),
        elevation: 10,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      width: 65.w,
                      height: 65.h,
                      child: Image(image: AssetImage("assets/icons/house.png"),),
                    ),
                  ),

                  Container(
                      height: 50.h,
                      width: 250.w,
                      child: Center(child: Text("House Price Prediction ", style: TextStyle(fontSize: 23.sp, color: Colors.white, fontWeight: FontWeight.w500
                      ),))),
                ],
              ),
            ),
            Divider(color: Colors.white60, thickness: 1,),




            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(child: Text("Predicted Price is Rs.= ${context.watch<ApiCallHouseNotifier>().predResult}",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500))),
            ),

            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(child: Text("Prediction is 59% Accurate",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500))),
            ),

          ],
        ),
      ),
    );
  }
}
