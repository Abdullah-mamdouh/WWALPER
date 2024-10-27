import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wwalper_app/core/theming/colors.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg, required void Function() onTap}) {
    showDialog(
        context: context,
        builder: (context) =>
            CupertinoAlertDialog(
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

}



