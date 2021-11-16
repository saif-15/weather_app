import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
