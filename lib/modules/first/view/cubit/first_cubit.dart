import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import 'package:pro_multimedia_zadanie/core/navigation/app_router.dart';
import 'package:pro_multimedia_zadanie/core/navigation/app_routes.dart';

part 'first_state.dart';
part 'first_cubit.freezed.dart';

class FirstCubit extends Cubit<FirstState> {
  FirstCubit() : super(const FirstState.loading());

  late VideoPlayerController _controller;

  @override
  Future<void> close() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();

    return super.close();
  }

  void init() async {
    _controller = VideoPlayerController.asset(
      'assets/videos/video.mp4',
    );

    await _controller.initialize();

    _controller.addListener(_videoPlayerListener);

    emit(
      FirstState.loaded(
        controller: _controller,
      ),
    );
  }

  void _videoPlayerListener() {
    if (_controller.value.position == _controller.value.duration) {
      routeToSecondScreen();
    }
  }

  void routeToSecondScreen() {
    AppRouter.instance.replace(
      AppRoutes.second.route,
    );
  }
}
