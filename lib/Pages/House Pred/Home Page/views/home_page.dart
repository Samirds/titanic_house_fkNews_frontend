import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/Utils/app_string.dart';
import '../../../../common/Base WIdget/home_page_layout.dart';




class HomePageHosuse extends StatelessWidget {
  const HomePageHosuse({super.key});

  @override
  Widget build(BuildContext context) {


    return HomePageLayout(
      imagePath: 'assets/images/house.jpg',
      appDescription: AppText.HDescription, appName: AppText.Hname,);

  }
}
