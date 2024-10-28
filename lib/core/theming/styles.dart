import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/core/theming/font_weight_helper.dart';

import '../utils/constants.dart';

class TextStyles {
  static final TextStyle font8GrayHint = TextStyle(
      fontSize: 8.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: ConstantsText.kAvenir,
      color: ColorsManager.grayHintColor);

  static TextStyle font13BlackBold = TextStyle(
    fontSize: 13.5.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font11_5BlackBold = TextStyle(
    fontSize: 11.5.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    //color: Colors.black,
  );

  static TextStyle font17MainPinkBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.pink,
  );

  static TextStyle font17GreyReqular = TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.gray);

  static TextStyle font15BlackSemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,

  );

  static TextStyle font15BlackBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font20MainRedBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainRed,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static TextStyle font13BlackRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );

  static TextStyle font9GrayRegular = TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static final TextStyle font10ExtraBold = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.extraBold,
      fontFamily: ConstantsText.kAvenir,
      color: ColorsManager.blackColor);

  static TextStyle font12BlackBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font13WhiteRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font13WhiteBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  static TextStyle font12WhiteBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.moreLightGray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    //color: ColorsManager.darkBlue,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );

}
