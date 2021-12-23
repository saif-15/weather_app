import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class SettingsChip extends StatefulWidget {
  final String content;
  const SettingsChip({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  _SettingsChipState createState() => _SettingsChipState();
}

class _SettingsChipState extends State<SettingsChip> {
  bool isEnabled = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEnabled = !isEnabled;
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: 30,
          decoration: BoxDecoration(
            color: isEnabled ? Colors.white70 : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: isEnabled ? null : Border.all(color: Colors.white70),
          ),
          child: Center(
            child: Text(
              widget.content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isEnabled ? Colors.black : Colors.white70),
            ),
          )),
    );
  }
}
