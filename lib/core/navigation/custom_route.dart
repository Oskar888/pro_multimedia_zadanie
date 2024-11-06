import 'package:fluro/fluro.dart';

class CustomRoute {
  const CustomRoute({
    required this.name,
    required this.route,
    required this.handler,
    required this.transitionType,
  });

  final String name;
  final String route;
  final Handler handler;
  final TransitionType transitionType;
}
