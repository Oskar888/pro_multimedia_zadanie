import 'package:flutter/material.dart';

import 'package:pro_multimedia_zadanie/core/navigation/app_router.dart';
import 'package:pro_multimedia_zadanie/core/navigation/app_routes.dart';
import 'package:pro_multimedia_zadanie/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppRouter.instance.init(
    routes: AppRoutes.allRoutes,
  );

  runApp(
    const App(),
  );
}
