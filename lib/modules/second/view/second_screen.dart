import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pro_multimedia_zadanie/modules/shared/view/loading_view.dart';

import 'cubit/second_cubit.dart';
import 'second_body.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
  });

  static const String routeName = '/second';

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const SecondScreen();
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecondCubit>(
      create: (_) => SecondCubit()..init(),
      child: BlocBuilder<SecondCubit, SecondState>(
        builder: (_, state) {
          return state.when(
            loading: () {
              return const LoadingView();
            },
            loaded: () {
              return const SecondBody();
            },
          );
        },
      ),
    );
  }
}
