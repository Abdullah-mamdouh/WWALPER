import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';

import '../../../../core/theming/colors.dart';
class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        width: 50.w,
        height: 50.h,
        //padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: ColorsManager.grayLightColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.h,
          ),
        ),
      ),
    );
  }
}
