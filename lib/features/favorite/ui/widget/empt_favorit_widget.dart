import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/core/theming/font_weight_helper.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../auth/ui/widgets/arrow_back_widget.dart';
import '../../../auth/ui/widgets/text_hint_widget.dart';

class EmptyFavoritWidget extends StatelessWidget {
  const EmptyFavoritWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*ArrowBackWidget(),
            verticalSpace(20),
            Text(
              AppStrings.favoriteKey,
              style: TextStyles.font20BlackBold,
            ),
            verticalSpace(10),
            TextHintWidget(
              text: AppStrings.favoritePhotosDescripKey,
            ),*/
            verticalSpace(30),
            Expanded(
              child: Image.asset(
                AppAssets.favoriteEmpty,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: GradientText(
                  AppStrings.noFavoritePhotosKey,
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.purpleColor,
                      ColorsManager.deepOrangeColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeightHelper.semiBold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text, {required this.gradient, required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
