import 'package:flutter/material.dart';

import 'package:pro_multimedia_zadanie/core/constants/app_text_styles.dart';

class ImageRecommendedBox extends StatelessWidget {
  final String imagePath;
  final String title;

  const ImageRecommendedBox({
    required this.imagePath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
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
                  backgroundColor: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: SizedBox(
              height: 35.0,
              width: 35.0,
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white.withOpacity(
                  0.275,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white.withOpacity(
                      0.5,
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
    );
  }
}
