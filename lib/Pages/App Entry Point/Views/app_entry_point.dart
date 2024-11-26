import 'package:ai_with_flutter/Pages/App%20Entry%20Point/Controller/app_entrypoint_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Home%20Page/views/home_page.dart';
import 'package:ai_with_flutter/common/Base%20WIdget/glass_effect_container.dart';
import 'package:ai_with_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

import '../../../common/Base WIdget/home_page_layout.dart';
import '../../../common/Utils/app_string.dart';
import '../../Fake News/Home Page/Views/home_page.dart';
import '../../Titanic/Home Page/views/home_page.dart';

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({super.key});

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {

  late final PageController _pageController;
  
  @override
  void initState(){
    super.initState();
    _pageController = PageController(
      initialPage: context.read<AppEntpNotifier>().selectPage
    );
  }



  
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        body:
        Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (page){
                context.read<AppEntpNotifier>().setSelectPage = page;
              },
              children: <Widget>[
                HomePageTitanic(),
                HomePageHosuse(),
                HomePageFkNews(),
              ],
            ),

            //---------------------------------- Dot Indicator --------------------------
            Positioned(
              bottom: 100.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.7,
                        height: 7.h,
                        child: PageViewDotIndicator(
                          currentItem: context.watch<AppEntpNotifier>().selectPage,
                          count: 3,
                          unselectedColor: Colors.grey,
                          selectedColor: Colors.blueAccent,
                          duration: const Duration(milliseconds: 200),
                          onItemClicked: (index){
                            _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                        ),
                      )

                    ],
                  ),
                ))
          ],
        ),

    );
  }
}
