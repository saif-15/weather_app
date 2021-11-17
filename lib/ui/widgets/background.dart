import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          child: CustomPaint(
            painter: CirclePainter(),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            child: Container(
              color: AppColors.dark_blue.withOpacity(0.6),
            ),
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black45,
                AppColors.dark_blue,
              ])),
        ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final paint = Paint()
      ..color = AppColors.light_blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(width + 10, 10), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate == this;
  }
}
