import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';
import 'package:wwalper_app/core/theming/styles.dart';
import 'package:wwalper_app/core/utils/app_assets.dart';
import 'package:wwalper_app/core/utils/app_strings.dart';
import 'package:wwalper_app/core/widgets/app_text_button.dart';

import '../../features/auth/ui/widgets/arrow_back_widget.dart';
import '../../features/auth/ui/widgets/text_hint_widget.dart';
import '../../features/home/logic/home_provider.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  NoInternetConnectionWidget({super.key, this.onTap});
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //ArrowBackWidget(),
              //verticalSpace(20),

              Text(
                AppStrings.noInternetKey,
                style: TextStyles.font20BlackBold,
              ),
              verticalSpace(10),
              TextHintWidget(
                text: AppStrings.noInternetDescripKey,
              ),
              verticalSpace(30),
              Expanded(
                child: Image.asset(
                  AppAssets.noInternet,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: BouncingButton(
                    child: Text(
                      AppStrings.tryAgainKey,
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                    onPress: () {
                      onTap ?? Provider.of<HomeProvider>(context, listen: false).getWallpapers();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
