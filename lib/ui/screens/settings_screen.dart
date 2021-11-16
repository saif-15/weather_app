import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background()
      ],
    );
  }
}
