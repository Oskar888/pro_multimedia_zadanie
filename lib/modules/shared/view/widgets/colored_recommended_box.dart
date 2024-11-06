import 'package:flutter/material.dart';

import 'package:pro_multimedia_zadanie/core/constants/app_text_styles.dart';

class ColoredRecommendedBox extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final bool smallSize;

  const ColoredRecommendedBox({
    required this.backgroundColor,
    required this.title,
    required this.smallSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: smallSize ? 100.0 : 170.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: SizedBox(
              width: 150.0,
              child: Text(
                title,
                maxLines: 2,
                style: AppTextStyles.headerSmall.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: Transform.rotate(
              angle: 30.625,
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
