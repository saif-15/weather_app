import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/ui/widgets/vertical_spacing.dart';
import 'package:weather_app/utils/colors.dart';

class GridItemCard extends StatefulWidget {
  const GridItemCard({Key key}) : super(key: key);

  @override
  _GridItemCardState createState() => _GridItemCardState();
}

class _GridItemCardState extends State<GridItemCard> {
  bool isTabbed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTabbed = !isTabbed;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 20.0,
                    spreadRadius: -12.0,
                    color: Colors.black12)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isTabbed
                      ? [
                          AppColors.light_blue,
                          AppColors.light_blue.withOpacity(0.5)
                        ]
                      : [Colors.white10, Colors.white12]),
              // color: isTabbed ? AppColors.light_blue : Colors.white10,
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "32 \u2103",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Lottie.asset("assets/weather_storm.json", width: 50.0),
                ],
              ),
              Text(
                "Cloudy",
                style: TextStyle(color: AppColors.white, fontSize: 12.0),
              ),
              VerticalSpacing(
                height: 10.0,
              ),
              Text(
                "Karachi",
                style: TextStyle(color: AppColors.white, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
