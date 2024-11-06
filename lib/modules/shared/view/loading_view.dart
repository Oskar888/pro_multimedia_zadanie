import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        LinearProgressIndicator(
          value: null,
          minHeight: 1.5,
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: SizedBox(),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
