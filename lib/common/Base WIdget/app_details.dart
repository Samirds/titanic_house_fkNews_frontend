import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'glass_effect_container.dart';

//
Widget appDetails(
    {required String txt,
    required double txtSz,
    required Color clr,
    required FontWeight fw,
    blrx = 5.0,
    blry = 5.0,
    required conHeight,
    required conWidth,
    bool isAnmTxt = false}) {

  Text smplText =
      Text(txt, style: TextStyle(fontSize: txtSz, color: clr, fontWeight: fw));
  AnimatedTextKit animated_text = AnimatedTextKit(
    animatedTexts: [
      TypewriterAnimatedText(txt,
          textStyle: TextStyle(fontSize: txtSz, color: clr, fontWeight: fw),
          speed: Duration(milliseconds: 200),
          curve: Curves.linear)
    ],
    isRepeatingAnimation: false,
    stopPauseOnTap: true,
  );

  return GlassEffectContainer(
    blrY: blry,
    blrX: blrx,
    child: Container(
      height: conHeight,
      width: conWidth,
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: isAnmTxt ? animated_text : smplText,
      )),
    ),
  );
}
