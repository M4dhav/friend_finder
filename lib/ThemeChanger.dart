import 'package:flutter/material.dart';
import 'package:friendfinder/constants.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        'Theme',
        style: kThemeTextStyle,
      ),
      value: isSwitched,
      onChanged: (value) {
        setState(
          () {
            isSwitched = !isSwitched;
          },
        );
      },
      secondary: const Icon(Icons.nightlight_outlined),
    );
  }
}
