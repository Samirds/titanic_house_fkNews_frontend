import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';



import '../Utils/app_string.dart';
import 'app_details.dart';

class HomePageLayout extends StatelessWidget {
  HomePageLayout({super.key,
    required this.imagePath,
    required this.appDescription,
    required this.appName
  });

  final String imagePath;
  final String appName;
  final String appDescription;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              // this container do the blur effect
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(imagePath),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child:  Container(),
                  ),
                ),



              // ---------------------------this part doing the Styling part------------------------
              Positioned(
                top: 105.h,
                right: -70.w,
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    height: 400.h,
                    width: 400.w,
                    child: Padding(
                      padding:  EdgeInsets.all(5.0.w),
                      child:  ClipOval(
                        child: Image(image: AssetImage(imagePath),fit: BoxFit.cover,)),
                      ),
                    ),
                  ),
                ),


              // ---------------------------------this part is for Name----------------------
              Positioned(
                top: 50,
                left: 10,
              child: appDetails(txt: '${appName}', txtSz: 27.sp, clr: Colors.white, fw: FontWeight.bold, conHeight: 75.0.h, conWidth: 250.0.w, isAnmTxt: true)),

              // this part is for Description
              Positioned(
                bottom: 180,
                left: 10,
                right: 10,
                child: appDetails(txt: '${appDescription}',
                    txtSz: 19.sp, clr: Colors.white, fw: FontWeight.normal, blrx: 1.0, blry: 1.0, conHeight: 200.0.h, conWidth: 400.0.w),),


              //----------------------------------this part for button---------------------------------
              Positioned(
                bottom: 35,
                right: 10,
                child: GestureDetector(
                  onTap: (){
                    if(appName=="Titanic Survival"){
                      GoRouter.of(context).push('/predictionT');
                    }else if(appName=="House Price"){
                      GoRouter.of(context).push('/predictionH');
                    }else{
                      GoRouter.of(context).push('/predictionFN');
                    }

                  },
                    child: Card(elevation: 5, child: appDetails(txt: '${AppText.Open}', txtSz: 17.sp, clr: Colors.blueGrey, fw: FontWeight.bold, conHeight: 35.0.h, conWidth: 200.0.w,)))),



            ],
          ),


    );
  }
}
