import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/features/favorite/ui/widget/empt_favorit_widget.dart';
import 'package:wwalper_app/features/favorite/ui/widget/favorite_card_image.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/utils/app_strings.dart';
import '../../auth/ui/widgets/arrow_back_widget.dart';
import '../../auth/ui/widgets/text_hint_widget.dart';
import '../../home/ui/widgets/slide_fade_animation.dart';
import '../logic/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    Provider.of<PhotosProvider>(context, listen: false).getFavoritePhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(40),
          //ArrowBackWidget(),
          verticalSpace(20),
          Text(
            AppStrings.favoriteKey,
            style: TextStyles.font20BlackBold,
          ),
          verticalSpace(10),
          TextHintWidget(
            text: AppStrings.favoritePhotosDescripKey,
          ),
          Expanded(
            child: Consumer<PhotosProvider>(builder: (context, photosProvider, child) {
              photosProvider.getFavoritePhotos();
              if (photosProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              final favoritePhotos = photosProvider.favoritePhotos;
            
              if (favoritePhotos.isEmpty) {
                return EmptyFavoritWidget();
              }
              return StaggeredGridView.countBuilder(
                primary: false,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                itemCount: favoritePhotos.length,
                itemBuilder: (context, index) {
                  final photo = favoritePhotos[index];
                  return SlideFadeAnimation(
                    index: index,
                    animationDuration: 200,
                    verticalOffset: 200,
                    child: FavoriteCardImage(index: index, photo: photo),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
            }),
          ),
        ],
      ),
    );
  }
}
