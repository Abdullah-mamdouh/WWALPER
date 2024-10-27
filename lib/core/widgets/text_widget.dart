import 'package:flutter/material.dart';
import 'package:wwalper_app/core/theming/styles.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  HeaderText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style ?? TextStyles.font20MainRedBold);
  }
}

class BigContentText extends StatelessWidget {
  final String text;
  BigContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.font20BlackBold,
    );
  }
}

class ContentText extends StatelessWidget {
  final String text;
  ContentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.font15BlackBold,
    );
  }
}
