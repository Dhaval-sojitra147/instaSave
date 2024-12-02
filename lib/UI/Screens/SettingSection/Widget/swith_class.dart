import 'package:flutter/material.dart';
import 'package:instasave/UI/Screens/SettingSection/Widget/custom_switch.dart';

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch(
      {Key? key,
        required this.switchValue,
        required this.onChanged})
      : super(key: key);
  final bool switchValue;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomSwitch(
          value: switchValue,
          onChanged: onChanged,
    );
  }
}