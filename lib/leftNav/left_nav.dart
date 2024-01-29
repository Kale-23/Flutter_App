import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:outline_project/leftNav/listItem/list_item.dart';
import 'package:outline_project/theme/theme.dart';

class LeftNav extends StatelessWidget {
  const LeftNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Center(child: Text('NavBar')),
        ),
        const Column(
          children: [
            ListItem(
                text: 'first item',
                icon: FontAwesomeIcons.car,
                iconColor: black),
            ListItem(
                text: 'second item',
                icon: FontAwesomeIcons.bus,
                iconColor: black),
            ListItem(
                text: 'third item',
                icon: FontAwesomeIcons.plane,
                iconColor: black),
          ],
        ),
      ],
    );
  }
}
