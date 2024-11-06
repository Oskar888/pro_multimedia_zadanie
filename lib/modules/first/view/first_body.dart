import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'package:pro_multimedia_zadanie/core/constants/app_colors.dart';
import 'package:pro_multimedia_zadanie/core/constants/app_text_styles.dart';
import 'package:pro_multimedia_zadanie/modules/first/view/cubit/first_cubit.dart';
import 'package:pro_multimedia_zadanie/modules/shared/view/widgets/colored_recommended_box.dart';
import 'package:pro_multimedia_zadanie/modules/shared/view/widgets/image_recommended_box.dart';
import 'package:pro_multimedia_zadanie/modules/shared/view/widgets/recommended_icon.dart';

class FirstBody extends StatefulWidget {
  const FirstBody({
    super.key,
  });

  @override
  State<FirstBody> createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Set asset
    _controller = VideoPlayerController.asset(
      'assets/videos/video.mp4',
    );

    // Initialize the video player
    _initializeVideoPlayerFuture = _controller.initialize();

    // Add a listener to detect when the video finishes playing
    _controller.addListener(_videoPlayerListener);

    // Start the video player when initialized
    _playVideo();
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();
    super.dispose();
  }

  void _videoPlayerListener() {
    // Check if the video has finished playing
    if (_controller.value.isInitialized &&
        !_controller.value.isPlaying &&
        _controller.value.position == _controller.value.duration) {
      // Remove listener immediately
      _controller.removeListener(_videoPlayerListener);
      // Navigate to the next screen
      final FirstCubit cubit = context.read();
      cubit.routeToSecondScreen();
    }
  }

  void _playVideo() async {
    // Wait for the video player to finish initializing
    await _initializeVideoPlayerFuture;

    // Check if the controller is initialized before playing
    if (_controller.value.isInitialized) {
      await _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: _buildVideoSection(),
          ),
          Positioned.fill(
            top: 220.0,
            left: 0.0,
            right: 0.0,
            child: _buildRecommendedSection(),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      toolbarHeight: 35.0,
      scrolledUnderElevation: 0,
      leading: Row(
        children: [
          const SizedBox(
            width: 16.0,
          ),
          SizedBox(
            height: 35.0,
            width: 35.0,
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white.withOpacity(
                0.4,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black.withOpacity(
                      0.4,
                    ),
                    size: 20.0,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        SizedBox(
          height: 35.0,
          width: 35.0,
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.white.withOpacity(
              0.4,
            ),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black.withOpacity(
                  0.4,
                ),
                size: 20.0,
              ),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        SizedBox(
          height: 35.0,
          width: 35.0,
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.white.withOpacity(
              0.4,
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black.withOpacity(
                  0.4,
                ),
                size: 20.0,
              ),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
      ],
    );
  }

  Widget _buildVideoSection() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildRecommendedSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 15.0,
                    child: Text(
                      'Polecane',
                      style: AppTextStyles.headerRegular,
                    ),
                  ),
                  Positioned(
                    top: -32.5,
                    right: 10.0,
                    child: RecommendedIcon(
                      onTap: () {
                        final FirstCubit cubit = context.read();
                        cubit.routeToSecondScreen();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ColoredRecommendedBox(
                            backgroundColor: AppColors.customCyan,
                            title: 'Zaplanuj podróż',
                            smallSize: true,
                          ),
                          ColoredRecommendedBox(
                            backgroundColor: Colors.blue,
                            title: 'Szlaki',
                            smallSize: false,
                          ),
                          ImageRecommendedBox(
                            imagePath: 'assets/images/lake.png',
                            title: 'Dłuższe godziny zwiedzania muzeum',
                          ),
                          ImageRecommendedBox(
                            imagePath: 'assets/images/island.png',
                            title: 'Dłuższe godziny zwiedzania muzeum',
                          ),
                          ImageRecommendedBox(
                            imagePath: 'assets/images/castle.png',
                            title: 'Dłuższe godziny zwiedzania muzeum',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ImageRecommendedBox(
                            imagePath: 'assets/images/island.png',
                            title: 'Dłuższe godziny zwiedzania muzeum',
                          ),
                          ImageRecommendedBox(
                            imagePath: 'assets/images/castle.png',
                            title: 'Carbonerum dla licealistów',
                          ),
                          ImageRecommendedBox(
                            imagePath: 'assets/images/park.png',
                            title: 'Carbonerum nie tylko dla licealistów',
                          ),
                          ImageRecommendedBox(
                            imagePath: 'assets/images/lake.png',
                            title: 'Dłuższe godziny zwiedzania muzeum',
                          ),
                          ColoredRecommendedBox(
                            backgroundColor: AppColors.customCyan,
                            title: 'Zaplanuj podróż',
                            smallSize: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
