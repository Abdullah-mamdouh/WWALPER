import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/theming/colors.dart';

enum ToastStates { success, error, warning }

Color? toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = ColorsManager.blueBorder;
      break;
    case ToastStates.error:
      color = ColorsManager.redColor;
      break;
    case ToastStates.warning:
      color = ColorsManager.gold;
      break;
  }
  return color;
}

showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor(state),
      textColor: ColorsManager.whiteColor,
      fontSize: 13.sp,
    );

void showCustomDialog(
    {required BuildContext context,
    required String msg,
    required void Function() onTap}) {
  showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        msg,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 14,
              color: ColorsManager.mainRed,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(
            "Ok",
            style: TextStyle(
              color: ColorsManager.redColor,
              fontSize: 15.sp
            ),
          ),
        ),
        TextButton(
          onPressed: ()=> context.pop(),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(
            "Cancel",
            style: TextStyle(
              color: ColorsManager.blackColor,
                fontSize: 15.sp
            ),
          ),
        )
      ],
    ),
  );
}
