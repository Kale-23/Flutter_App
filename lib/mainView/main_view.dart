import 'package:flutter/widgets.dart';

import 'package:outline_project/theme/theme.dart';

class MainView extends StatelessWidget {
  final String text;
  const MainView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: const TextStyle(color: Color.fromRGBO(150, 123, 209, 1)),
      ),
    );
  }
}
