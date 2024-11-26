// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'common/Utils/app_string.dart';
// import 'common/Widgets/app_details.dart';
//
// class TitanicPage extends StatelessWidget {
//   const TitanicPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // this container do the blur effect
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: ExactAssetImage('assets/images/ship_sinking.png'),
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//               child:  Container(),
//             ),
//           ),
//
//
//           // this part doing the Styling part
//           Positioned(
//             top: 75,
//             right: -70,
//             child: ClipOval(
//               child: Container(
//                 color: Colors.white,
//                 height: 400,width: 400,
//                 child: Padding(
//                   padding:  EdgeInsets.all(5.0.w),
//                   child: const ClipOval(
//                     child: Image(image: AssetImage("assets/images/ship_sinking.png"),fit: BoxFit.cover,),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           // this part is for Name
//           Positioned(
//             top: 50,
//             left: 10,
//             child: appDetails(txt: '${AppText.Tname}', txtSz: 27.sp, clr: Colors.white, fw: FontWeight.bold, conHeight: 75.0.h, conWidth: 250.0.w, isAnmTxt: true),
//           ),
//
//           // this part is for Description
//           Positioned(
//             bottom: 250,
//             left: 10,
//             right: 10,
//             child: appDetails(txt: '${AppText.TDescription}',
//                 txtSz: 19.sp, clr: Colors.white, fw: FontWeight.normal, blrx: 1.0, blry: 1.0, conHeight: 200.0.h, conWidth: 400.0.w),),
//
//
//           //this part for button
//           Positioned(
//             bottom: 35,
//             right: 10,
//             child: appDetails(txt: '${AppText.Open}', txtSz: 17.sp, clr: Colors.white, fw: FontWeight.bold, conHeight: 35.0.h, conWidth: 200.0.w,),),
//
//
//
//         ],
//       ),
//     );
//   }
// }
