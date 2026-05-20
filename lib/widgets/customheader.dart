import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign align;

  const CustomHeader({
    super.key,
    required this.title,
    this.fontSize = 30.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.bold,
    this.align = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
