import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pro_multimedia_zadanie/core/constants/app_colors.dart';
import 'package:pro_multimedia_zadanie/core/constants/app_text_styles.dart';
import 'package:pro_multimedia_zadanie/modules/second/view/cubit/second_cubit.dart';
import 'package:pro_multimedia_zadanie/modules/shared/view/widgets/colored_recommended_box.dart';
import 'package:pro_multimedia_zadanie/modules/shared/view/widgets/image_recommended_box.dart';
import 'package:pro_multimedia_zadanie/modules/shared/view/widgets/recommended_icon.dart';

class SecondBody extends StatelessWidget {
  const SecondBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildRecommendedSection(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      toolbarHeight: 70.0,
      scrolledUnderElevation: 0,
      title: Text(
        'Logo',
        style: AppTextStyles.headerRegular,
      ),
      centerTitle: true,
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
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black.withOpacity(
                      0.8,
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
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black.withOpacity(
                  0.8,
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
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black.withOpacity(
                  0.8,
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

  Widget _buildRecommendedSection(
    BuildContext context,
  ) {
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
                        final SecondCubit cubit = context.read();
                        cubit.routeToFirstScreen();
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
