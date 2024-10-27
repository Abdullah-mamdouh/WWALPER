import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wwalper_app/core/utils/app_assets.dart';

class InfanciaLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const InfanciaLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SvgPicture.asset(
          AppAssets.appLogo,
          width:width?? 225.w,
          height:height??  225.h,
        ),
        const Spacer(),
      ],
    );
  }
}
