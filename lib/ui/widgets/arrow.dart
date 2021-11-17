import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:weather_app/utils/colors.dart';

class Arrow extends StatelessWidget {
  final double angle;
  const Arrow({Key key, this.angle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: math.radians(angle),
        child: Icon(
          Icons.arrow_downward,
          color: AppColors.white,
        ));
  }
}
