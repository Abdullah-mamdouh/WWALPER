import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconTextFormField extends StatelessWidget {
  final String image;
  final double? topPadding,
      bottomPadding,
      startPadding,
      endPadding,
      height,
      width;

  const CustomIconTextFormField(
      {super.key,
      required this.image,
      this.topPadding,
      this.bottomPadding,
      this.startPadding,
      this.endPadding,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: startPadding ?? 12.w,
        top: topPadding ?? 12.h,
        bottom: bottomPadding ?? 12.h,
        end: endPadding ?? 12.w,
      ),
      child: SvgPicture.asset(
        image,
        height: height ?? 15.h,
        width: width ?? 11.w,
        matchTextDirection: true,
      ),
    );
  }
}
