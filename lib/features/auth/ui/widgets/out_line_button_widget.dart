import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AppOutLineButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Widget icon;
  const AppOutLineButton(
      {Key? key, required this.text, this.style, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(

          fixedSize: WidgetStatePropertyAll(Size(width(context), 65.h)),
          iconSize: WidgetStatePropertyAll(20.h),
          // backgroundColor: WidgetStatePropertyAll(ColorsManager.whiteColor),
          side: WidgetStatePropertyAll(
            const BorderSide(
              color: ColorsManager.moreLightGray,
              width: 0.2,
            ),
          ),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r)))),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          // horizontalSpace(8),
          Text(
            text,
            style: style ?? TextStyles.font16WhiteSemiBold,
          ),
        ],
      ),
    );
  }
}
