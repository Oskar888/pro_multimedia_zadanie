import 'package:flutter/material.dart';

import 'package:pro_multimedia_zadanie/core/constants/app_colors.dart';

class RecommendedIcon extends StatefulWidget {
  final VoidCallback onTap;

  const RecommendedIcon({
    required this.onTap,
    super.key,
  });

  @override
  State<RecommendedIcon> createState() => _RecommendedIconState();
}

class _RecommendedIconState extends State<RecommendedIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.customCyan,
        ),
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 2.0,
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
                size: 32.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
