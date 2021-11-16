import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class CustomBottomBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomBar(
      {Key key,
      @required this.icons,
      @required this.selectedIndex,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicatorPadding: EdgeInsets.zero,
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                  icon: Icon(
                e,
                color: i == selectedIndex ? AppColors.white : AppColors.gray,
              ))))
          .values
          .toList(),
      automaticIndicatorColorAdjustment: true,
      indicator: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.white, width: 3.0))),
    );
  }
}
