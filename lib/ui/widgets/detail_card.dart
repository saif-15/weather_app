import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/ui/widgets/vertical_spacing.dart';
import 'package:weather_app/utils/colors.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white12.withOpacity(0.1),
            AppColors.dark_blue.withOpacity(0.1)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Friday",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                VerticalSpacing(
                  height: 4.0,
                ),
                Text(
                  "May 28",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "32 \u2103",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Lottie.asset("assets/weather_mist.json", width: 70, height: 70)
          ],
        ),
      ),
    );
  }
}
