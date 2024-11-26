import 'dart:ui';

import 'package:ai_with_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassEffectContainer extends StatelessWidget {
   GlassEffectContainer({super.key,
     this.bRadius = 12,
     this.blrX = 5,
     this.blrY = 5,
     required this.child
   });


  final double bRadius;
  final double blrX;
  final double blrY;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.white.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(bRadius),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blueAccent.withOpacity(0.5),
                        Colors.white.withOpacity(0.1)
                      ])
              ),
              //child: Center(child: child),
              child: Center(child: child),
            );

  }
}
