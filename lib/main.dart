import 'package:ai_with_flutter/Pages/App%20Entry%20Point/Controller/app_entrypoint_notifier.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Home%20Page/views/home_page.dart';
import 'package:ai_with_flutter/Pages/House%20Pred/Prediction%20Page/Controller/furnishStatus_houe_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/age_text_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/sibsp_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/fare_text_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Controller/gender_radio_notifier.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/WIdgets/fare_text_field.dart';
import 'package:ai_with_flutter/titanic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Pages/App Entry Point/Views/app_entry_point.dart';
import 'Pages/Fake News/Home Page/Views/home_page.dart';
import 'Pages/House Pred/Api Call/api_call_house_notifier.dart';
import 'Pages/House Pred/Prediction Page/Controller/area_house_notifier.dart';
import 'Pages/House Pred/Prediction Page/Controller/bathrooms_house_notifier.dart';
import 'Pages/House Pred/Prediction Page/Controller/bedrooms_house_notifier.dart';

import 'Pages/House Pred/Prediction Page/Controller/y_n_radio_notifier.dart';
import 'Pages/Titanic/Api Call/api_call_notifier.dart';
import 'Pages/Titanic/Home Page/views/home_page.dart';
import 'Pages/Titanic/Prediction Page/Controller/dropdwn_cabin_notifier.dart';
import 'Pages/Titanic/Prediction Page/Controller/dropdwn_embarked_notifier.dart';
import 'Pages/Titanic/Prediction Page/Controller/dropdwn_pclass_notifier.dart';
import 'Pages/Titanic/Prediction Page/Controller/parch_notifier.dart';
import 'common/Utils/app_routes.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppEntpNotifier()),
        ChangeNotifierProvider(create: (_) => GenderRdNotifier()),
        ChangeNotifierProvider(create: (_) => EmbarkedDrpDnNotifier()),
        ChangeNotifierProvider(create: (_) => CabinDrpDnNotifier()),
        ChangeNotifierProvider(create: (_) => PclassDrpDnNotifier()),
        ChangeNotifierProvider(create: (_) => AgeTextNotifier()),
        ChangeNotifierProvider(create: (_) => FareTextNotifier()),
        ChangeNotifierProvider(create: (_) => SibSpTextNotifier()),
        ChangeNotifierProvider(create: (_) => ParchTextNotifier()),
        ChangeNotifierProvider(create: (_) => ApiCallNotifier()),
        ChangeNotifierProvider(create: (_) => YNRadioNotifier()),
        ChangeNotifierProvider(create: (_) => furnishStatuts_notifier()),
        ChangeNotifierProvider(create: (_) => AreaHouseNotifier()),
        ChangeNotifierProvider(create: (_) => BathroomsHouseNotifier()),
        ChangeNotifierProvider(create: (_) => BedroomsHouseNotifier()),
        ChangeNotifierProvider(create: (_) => ApiCallHouseNotifier()),


      ],
  child: const MyApp(),));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: screenSize,
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return MaterialApp.router(
              routerConfig: router,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),

          );
        },
      child: AppEntryPoint(),
        );
  }
}
