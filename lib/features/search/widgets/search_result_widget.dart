import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/widgets/no_internet_connection_widget.dart';

import '../../../core/di/injection.dart';
import '../../home/logic/home_provider.dart';
import '../../home/logic/home_state.dart';
import '../../home/ui/widgets/image_card.dart';
import '../../home/ui/widgets/slide_fade_animation.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.0.w),
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
          final state = provider.state;
          if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is NoInternet) {
            return Center(child: NoInternetConnectionWidget(onTap: () => (),));
          }
          return StaggeredGridView.countBuilder(
            shrinkWrap: false,
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemCount: provider.wallpapersSearch.isNotEmpty
                ? provider.wallpapersSearch.length
                : 1, // Handle empty state
            itemBuilder: (context, index) {
              if (provider.wallpapersSearch.isNotEmpty) {
                var photo = provider.wallpapersSearch[index];
                return SlideFadeAnimation(
                  index: index,
                  animationDuration: 200,
                  verticalOffset: 200,
                  child: ImageCard(
                    photo: photo,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        }),
    );
  }
}
