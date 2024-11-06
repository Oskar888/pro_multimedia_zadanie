import 'package:flutter/material.dart';

import 'package:pro_multimedia_zadanie/core/navigation/app_router.dart';
import 'package:pro_multimedia_zadanie/core/navigation/app_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.first.route,
      navigatorKey: AppRouter.instance.navigatorKey,
      onGenerateRoute: _handleRoute,
    );
  }
}

Route<dynamic>? _handleRoute(RouteSettings settings) {
  final bool routeExists = AppRouter.instance.routeExists(
    settings.name,
  );

  if (!routeExists) {
    return AppRouter.instance.router.generator(
      const RouteSettings(
        name: '/first',
      ),
    );
  }

  return AppRouter.instance.router.generator(
    settings,
  );
}
