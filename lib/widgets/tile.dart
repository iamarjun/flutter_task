import 'package:flutter/material.dart';
import 'package:flutter_task/constants.dart';

class Tile extends StatelessWidget {
  const Tile(this.backgroundColor, this.text);

  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: kTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
