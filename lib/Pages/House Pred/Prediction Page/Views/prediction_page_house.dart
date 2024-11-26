import 'package:ai_with_flutter/Pages/House%20Pred/Api%20Call/api_call_house_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/area_house_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/bathrooms_house_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/bedrooms_house_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/furnishStatus_houe_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/y_n_radio_notifier.dart';
import 'package:ai_with_flutter/common/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../common/Base WIdget/glass_effect_container.dart';

import 'package:http/http.dart' as http;


import '../Widgets/aler_dialog_house.dart';
import '../Widgets/dropdown_house.dart';
import '../Widgets/report_card_house.dart';
import '../Widgets/y_n_radio.dart';
import 'area_textField_house.dart';

class PredictionPageH extends StatefulWidget {
  PredictionPageH({super.key});

  @override
  State<PredictionPageH> createState() => _PredictionPageTState();
}

class _PredictionPageTState extends State<PredictionPageH> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // this line is for keyboard to dismiss to torch on Screen
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // -----------------this is for image part----------------------------------
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.blueGrey,
              expandedHeight: 200.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/house.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1.h),
                  child: Container(
                      color: Colors.blueGrey,
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                            "${AppText.Hname}",
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )))),
            ),
            SliverToBoxAdapter(
              child: GlassEffectContainer(
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h,),

                      // --------------------------------------No. of Bed Rooms----------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Bedroom Type : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          DrpdwnHouse(
                              context: context,
                              selectOption: 'Select',
                              ntfType: 'bedrooms'),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      //---------------------------------- Main Road ----------------------
                      RadioFrYN(context: context, feature: "Main Road", featureType: 'mainroad'),
                      SizedBox(height: 5.h,),
                      const Divider(color: Colors.blueGrey, indent: 20, endIndent: 20, thickness: 3,),
                      SizedBox(height: 5.h,),


                      //--------------------------------------No. of BathRooms----------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Bathroom Type : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          DrpdwnHouse(
                              context: context,
                              selectOption: 'Select',
                              ntfType: 'bathrooms'),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      //---------------------------------- Multi-Stories ----------------------
                      RadioFrYN(context: context, feature: "Multi-Stories", featureType: 'multistore'),

                      Text("**Set Yes if your House have more than one Stories"),
                      SizedBox(height: 5.h,),
                      const Divider(color: Colors.blueGrey, indent: 20, endIndent: 20, thickness: 3,),
                      SizedBox(height: 5.h,),


                      //---------------------------------- Guest Rooms----------------------
                      RadioFrYN(context: context, feature: "Guestrooms", featureType: 'guestroom'),
                      SizedBox(height: 5.h,),

                      //---------------------------------- Basement ----------------------
                      RadioFrYN(context: context, feature: "Basement", featureType: 'basement'),
                      SizedBox(height: 5.h,),
                      //---------------------------------- Prefarea ----------------------
                      RadioFrYN(context: context, feature: "Prefarea", featureType: 'pfarea'),
                      SizedBox(height: 5.h,),
                      const Divider(color: Colors.blueGrey, indent: 20, endIndent: 20, thickness: 3,),
                      SizedBox(height: 5.h,),


                      //--------------------------------------Furnished Status----------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Furnished Status : ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 75.w,
                          ),
                          DrpdwnHouse(
                            context: context,
                            selectOption: 'Select Status',
                            ntfType: 'furnished',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      //---------------------------------- Luxury Items ----------------------
                      RadioFrYN(context: context, feature: "Luxury Items", featureType: 'luxury'),
                      SizedBox(height: 5.h,),
                      Text("**Select No if you dont have neither water Heating nor AC "),

                      //---------------------------------- Parking ----------------------
                      RadioFrYN(context: context, feature: "Parking", featureType: 'park'),
                      SizedBox(height: 5.h,),
                      Text("**Select Yes if you  have > 1 parking space "),
                      SizedBox(height: 5.h,),

                      //------------------------------------- Total Area------------------------
                      AreaHouseTextFormField(context: context),
                      SizedBox(height: 15.h,),




                      context.watch<ApiCallHouseNotifier>().repotCardShow?
                      context.watch<ApiCallHouseNotifier>().isloading?CircularProgressIndicator():ReprotCartHouse()
                          :SizedBox(height: 1.w,),


                      //context.watch<ApiCallNotifier>().isloading?CircularProgressIndicator():ReprotCart(),
                      SizedBox(
                        height: 5.h,
                      ),

                      //Btn
                      GestureDetector(
                        onTap: () {
                          print("clicked");
                          print("${context.read<YNRadioNotifier>().defaultPF}");

                          if(context.read<AreaHouseNotifier>().areaFormKey.currentState!.validate() &&
                              context.read<BathroomsHouseNotifier>().defaultFeature != "" &&
                              context.read<BedroomsHouseNotifier>().defaultFeature != "" &&
                              context.read<furnishStatuts_notifier>().defaultFeature != ""){

                            context.read<ApiCallHouseNotifier>().setShowReportCard = true;
                            context.read<ApiCallHouseNotifier>().predict(context);

                          }else{
                            showAlertDialog(context);
                          }


                        },
                        child: Container(
                          height: 30,
                          //width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blueAccent.withOpacity(0.5),
                                    Colors.white.withOpacity(0.1)
                                  ])),
                          child: Center(
                            child: Text("Let's Predict",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w400)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
