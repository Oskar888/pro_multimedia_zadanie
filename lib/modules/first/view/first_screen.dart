import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pro_multimedia_zadanie/modules/shared/view/loading_view.dart';

import 'cubit/first_cubit.dart';
import 'first_body.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
  });

  static const String routeName = '/first';

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const FirstScreen();
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirstCubit>(
      create: (_) => FirstCubit()..init(),
      child: BlocBuilder<FirstCubit, FirstState>(
        builder: (_, state) {
          return state.when(
            loading: () {
              return const LoadingView();
            },
            loaded: (controller) {
              return FirstBody(
                controller: controller,
              );
            },
          );
        },
      ),
    );
  }
}
