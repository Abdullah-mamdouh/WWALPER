import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wwalper_app/core/widgets/no_internet_connection_widget.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';
import 'package:wwalper_app/features/home/logic/home_state.dart';
import 'package:wwalper_app/features/home/ui/widgets/slide_fade_animation.dart';

import '../../../../core/di/injection.dart';
import 'image_card.dart';
import 'package:provider/provider.dart';

class PhotosListWidget extends StatefulWidget {
  PhotosListWidget({Key? key}) : super(key: key);

  @override
  State<PhotosListWidget> createState() => _PhotosListWidgetState();
}

class _PhotosListWidgetState extends State<PhotosListWidget> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<HomeProvider>()..getWallpapers(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          final state = provider.state;
          if (state is Initial) {
            return Center(child: CircularProgressIndicator());
          }else if (state is NoInternet) {
            return Center(child: NoInternetConnectionWidget());
          }
          return SmartRefresher(
            footer: ClassicFooter(
              loadingText: 'Loading',
              noDataText: 'No More Data',
            ),
            enablePullUp: true,
            enablePullDown: true,
            controller: refreshController,
            onLoading: () async {
              await provider.loadMoreData();
              refreshController.loadComplete();
            },
            onRefresh: () async {
              await provider.refreshData();
              refreshController.refreshCompleted();
            },
            child: StaggeredGridView.countBuilder(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              itemCount: provider.wallpapers.isNotEmpty
                  ? provider.wallpapers.length
                  : 1, // Handle empty state
              itemBuilder: (context, index) {
                if (provider.wallpapers.isNotEmpty) {
                  var photo = provider.wallpapers[index];
                  return SlideFadeAnimation(
                    index: index,
                    animationDuration: 200,
                    verticalOffset: 200,
                    child: ImageCard(
                      photo: photo,
                      isPremium: index % 3 == 0 ? true: false,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          );
        },
      ),
    );
  }
}
