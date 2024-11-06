import 'package:fluro/fluro.dart';
import 'package:pro_multimedia_zadanie/modules/second/view/second_screen.dart';

import 'custom_route.dart';

import 'package:pro_multimedia_zadanie/modules/first/view/first_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final List<CustomRoute> allRoutes = <CustomRoute>[
    first,
    second,
  ];

  static final CustomRoute first = CustomRoute(
    name: 'First',
    route: 'first',
    handler: FirstScreen.routeHandler,
    transitionType: TransitionType.inFromTop,
  );

  static final CustomRoute second = CustomRoute(
    name: 'Second',
    route: 'second',
    handler: SecondScreen.routeHandler,
    transitionType: TransitionType.inFromBottom,
  );
}
