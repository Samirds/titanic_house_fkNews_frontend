import 'package:ai_with_flutter/Pages/App%20Entry%20Point/Views/app_entry_point.dart';
import 'package:ai_with_flutter/Pages/Titanic/Prediction%20Page/Views/prediction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../Pages/Fake News/Home Page/Views/prediction_page_fake_news.dart';
import '../../Pages/House Pred/Prediction Page/Views/prediction_page_house.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
    initialLocation: "/",
    routes: [
      GoRoute(
          path: "/",
      builder: (BuildContext context, GoRouterState state) => const AppEntryPoint()),

      GoRoute(
          path: "/predictionT",
          builder: (BuildContext context, GoRouterState state) => PredictionPageT()),

      GoRoute(
          path: "/predictionH",
          builder: (BuildContext context, GoRouterState state) => PredictionPageH()),

      GoRoute(
          path: "/predictionFN",
          builder: (BuildContext context, GoRouterState state) => PredictionPageFN()),
    ]
);

GoRouter get router => _router;