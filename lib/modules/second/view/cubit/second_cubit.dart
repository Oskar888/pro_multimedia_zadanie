import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pro_multimedia_zadanie/core/navigation/app_router.dart';
import 'package:pro_multimedia_zadanie/core/navigation/app_routes.dart';

part 'second_state.dart';
part 'second_cubit.freezed.dart';

class SecondCubit extends Cubit<SecondState> {
  SecondCubit() : super(const SecondState.loading());

  void init() async {
    emit(
      const SecondState.loaded(),
    );
  }

  void routeToFirstScreen() {
    AppRouter.instance.replace(
      AppRoutes.first.route,
    );
  }
}
