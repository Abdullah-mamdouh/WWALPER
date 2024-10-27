import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/core/utils/app_assets.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.grey.withOpacity(0.1),
      elevation: 3.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: ColorsManager.gray,
          ),
          Image.asset(
            AppAssets.appLogo,
            width: 170.w,
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,color: ColorsManager.gray,),),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
