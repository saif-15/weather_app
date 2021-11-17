import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            children: [
              VerticalSpacing(
                height: 10.0,
              ),
              Text(
                "Forecast Report",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                height: 10.0,
              ),
              TodayCardList(
                title: "Today",
                date: "24 May 2022",
              ),
              VerticalSpacing(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Text(
                      "Next Forecast",
                      style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 16.0),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Icon(
                        Icons.calendar_today,
                        color: AppColors.gray,
                      ))
                ],
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return DetailCard();
                    }),
              )
            ],
          ),
        )),
      ],
    );
  }
}
