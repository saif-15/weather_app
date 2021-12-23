import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/ui/widgets/horizontal_spacing.dart';
import 'package:weather_app/ui/widgets/vertical_spacing.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/image_helper.dart';

class GridItemCard extends StatefulWidget {
  final String temp;
  final String main;
  final String cityName;
  final int timestamp;
  final dynamic minTemp;
  final dynamic maxtemp;
  const GridItemCard(
      {Key key,
      this.temp,
      this.main,
      this.cityName,
      this.timestamp,
      this.minTemp,
      this.maxtemp})
      : super(key: key);

  @override
  _GridItemCardState createState() => _GridItemCardState();
}

class _GridItemCardState extends State<GridItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.light_blue.withOpacity(0.7),
            AppColors.light_blue,
          ]),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.temp} \u2103",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Lottie.asset(
                    ImageHelper.getImagePath(widget.main, widget.timestamp),
                    width: 50.0),
              ],
            ),
            VerticalSpacing(
              height: 5.0,
            ),
            Text(
              "Min:  ${widget.minTemp}  \u2103",
              style: TextStyle(color: AppColors.white, fontSize: 12.0),
            ),
            HorizontalSpacing(
              width: 5.0,
            ),
            Text(
              "Max:  ${widget.maxtemp}  \u2103",
              style: TextStyle(color: AppColors.white, fontSize: 12.0),
            ),
            VerticalSpacing(
              height: 5.0,
            ),
            Text(
              "${widget.main}",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ),
            VerticalSpacing(
              height: 10.0,
            ),
            Text(
              "${widget.cityName}",
              style: TextStyle(color: AppColors.white, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
