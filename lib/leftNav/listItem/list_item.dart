//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

const iconTextStyle = TextStyle(
  color: Color.fromRGBO(255, 255, 255, 1),
  fontWeight: FontWeight.w100,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 12,
  height: 2,
);

class ListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  const ListItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20.0,
        ),
        const Gap(8),
        Text(
          text,
          style: iconTextStyle,
        )
      ],
    );
  }
}
