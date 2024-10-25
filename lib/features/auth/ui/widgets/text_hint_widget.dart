import 'package:flutter/material.dart';
import 'package:wwalper_app/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class TextHintWidget extends StatelessWidget {
  final String text;
  const TextHintWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.font13WhiteRegular.copyWith(
        color: ColorsManager.hintTextColor
      ),
    );
  }
}
