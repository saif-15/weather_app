import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/date_time.dart';

class Footer extends StatelessWidget {
  final int time;
  const Footer({Key key, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Last Updated :",
            style: TextStyle(color: AppColors.gray),
          ),
          Text(
            DateTimeFormat.footerDate(time),
            style: TextStyle(color: AppColors.gray),
          )
        ],
      ),
    );
  }
}
