import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/core/utils/app_strings.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';

import '../../../core/helpers/validator/validators.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../auth/ui/widgets/text_hint_widget.dart';

class SearchAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: MediaQuery.sizeOf(context).height*0.3.h,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(40),
          Text(
            AppStrings.searchKey,
            style: TextStyles.font20BlackBold,
          ),
          verticalSpace(10),
          TextHintWidget(
            text: AppStrings.searchingDescripKey,
          ),
          verticalSpace(10),
          Consumer<HomeProvider>(builder: (context, provider, child) {
            return AppTextFormField(
              onChangeFunction: (value){
                if (value.isNotEmpty) {
                  provider.emitSearchWallpapersStates(value);
                }
              },
              controller: provider.searchController,
              hintText: AppStrings.searchHintKey,
              keyboardType: TextInputType.text,
              validator: fullNameValidator(),
            );
          }),
          verticalSpace(10),
        ],
      ),
      bottom: TabBar(
        enableFeedback: true,
        labelStyle: const TextStyle(fontSize: 16),
        labelColor: ColorsManager.purpleColor,
        unselectedLabelColor: ColorsManager.gray,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        indicatorColor: ColorsManager.purpleColor,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: ColorsManager.moreLightGray,
        indicatorWeight: 2,
        tabs: const [
          Tab(text: 'Photo'),
          Tab(text: 'Category'),
          Tab(text: 'Author'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(230.h);
}
