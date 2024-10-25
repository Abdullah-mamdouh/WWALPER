import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wwalper_app/core/theming/styles.dart';

class DrawerItemWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String assetImageUrl, title;
  final double? imageHeight,imageWidth;

  const DrawerItemWidget(
      {super.key,
      required this.onPressed,
      required this.assetImageUrl,
      this.imageHeight,
      this.imageWidth,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              assetImageUrl,
              width: imageWidth?? 22.w,
              height: imageHeight?? 22.h,
            ),
          ),
          
          Expanded(
             flex: 3,
            child: Text(
              title,
              style: TextStyles.font15BlackBold.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
