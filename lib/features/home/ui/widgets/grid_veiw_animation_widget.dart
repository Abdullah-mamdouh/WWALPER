import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wwalper_app/app.dart';
import 'package:wwalper_app/features/home/ui/widgets/slide_fade_animation.dart';

import '../../data/models/wallpaper_model.dart';
import 'image_card.dart';

class GridVeiwAnimationWidget extends StatelessWidget {
  GridVeiwAnimationWidget(
      {Key? key, required this.myPhotos, })
      : super(key: key);

  List<Photos> myPhotos;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: false,
        //controller: scrollController,
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        itemCount:
            myPhotos.isNotEmpty ? myPhotos.length : 1, // Handle empty state
        itemBuilder: (context, index) {
          if (myPhotos.isNotEmpty) {
            var photo = myPhotos[index];
            return SlideFadeAnimation(
              index: index,
              animationDuration: 2000,
              verticalOffset: 200,
              child: ImageCard(
                photo: photo,
              ),
            );
          } else {
            // Fallback widget when myPhotos is empty
            return Center(
              child: Text('No photos available'),
            );
          }
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      ),
    );
  }
}
