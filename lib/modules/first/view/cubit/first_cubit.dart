import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pro_multimedia_zadanie/core/navigation/app_router.dart';
import 'package:pro_multimedia_zadanie/core/navigation/app_routes.dart';

part 'first_state.dart';
part 'first_cubit.freezed.dart';

class FirstCubit extends Cubit<FirstState> {
  FirstCubit() : super(const FirstState.loading());

  void init() async {
    emit(
      const FirstState.loaded(),
    );
  }

  void routeToSecondScreen() {
    AppRouter.instance.replace(
      AppRoutes.second.route,
    );
  }
}
