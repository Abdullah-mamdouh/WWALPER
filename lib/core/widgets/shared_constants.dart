import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wwalper_app/core/theming/colors.dart';

//'6eb886e4-78b4-4f47-a08a-b635f5398df0';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg,required void Function() onTap}) {
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
                      //primary: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    child: Text("Ok",
                    style: TextStyle(
                      color: ColorsManager.grayColor
                    ),
                    ))
              ],
            ));
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: color ?? ColorsManager.mainBlue,
        gravity: gravity ?? ToastGravity.BOTTOM,
        msg: msg);
  }
}

Widget defaultLine({
  Color? color
}) => Container(
      width: double.infinity,
      height: 1,
      color:color??ColorsManager.gray,
    );
    

class ValidationUtils {
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

