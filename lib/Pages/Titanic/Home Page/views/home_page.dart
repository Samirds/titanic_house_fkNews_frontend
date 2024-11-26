import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/Utils/app_string.dart';
import '../../../../common/Base WIdget/app_details.dart';
import '../../../../common/Base WIdget/home_page_layout.dart';



class HomePageTitanic extends StatelessWidget {
  const HomePageTitanic({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePageLayout(
      imagePath: 'assets/images/ship_sinking.png',
      appDescription: AppText.TDescription, appName: AppText.Tname,);

  }
}
