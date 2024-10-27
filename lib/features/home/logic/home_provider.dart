import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wwalper_app/features/home/data/home_repo.dart';
import 'package:wwalper_app/features/home/data/models/wallpaper_model.dart';

import '../../../core/networking/internet_checker.dart';
import '../../../core/utils/constants.dart';
import 'home_state.dart';

class HomeProvider extends ChangeNotifier {
  final WallpaperRepo wallpaperRepo;
  final InternetCheckerImpl internetChecker;

  late RefreshController refreshController;

  HomeProvider({
    required this.wallpaperRepo,
    required this.internetChecker,
  }) {
    refreshController = RefreshController(initialRefresh: false);
  }

  // @override
  // void dispose() {
  //   refreshController.dispose();
  //   super.dispose();
  // }

  int pageNumber = Random().nextInt(100);
  List<Photos> wallpapers = [];
  HomeState _state = HomeState.initial();

  HomeState get state => _state;

  void _setState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  final searchController = TextEditingController();
  List<Photos> wallpapersSearch = [];
  Future<void> emitSearchWallpapersStates(String category,) async {
    if (await internetChecker.isConnected) {
    _setState(HomeState.loading());
    final response = await wallpaperRepo.searchWallpapers(
      category: category,
    );
    response.when(
      success: (response) {
        _setState(HomeState.success(response));
        wallpapersSearch = response.photos ?? [];
      },
      failure: (error) {
        _setState(HomeState.error(error: error.errorModel.message ?? ''));
      },
    );
    }else{
      _setState(HomeState.noInternet());
    }
  }


  Future<void> emitGetWallpapersStates({
    String? category,
    int? page,
  }) async {
    _setState(HomeState.loading());
    final response = await wallpaperRepo.getWallpapers(
      page: page ?? pageNumber,
      category: category ?? ConstantsText.categoriesList[Random().nextInt(11)],
    );
    response.when(
      success: (response) {
        _setState(HomeState.success(response));
        pageNumber++;
        wallpapers.addAll(response.photos ?? []);
      },
      failure: (error) {
        _setState(HomeState.error(error: error.errorModel.message ?? ''));
      },
    );
  }

  Future<void> getWallpapers({String? category, int? page}) async {
    if (await internetChecker.isConnected) {
      await emitGetWallpapersStates(page: page, category: category);
    } else {
      _setState(HomeState.noInternet());
    }
  }

  Future<void> loadMoreData() async {
    try {
      await getWallpapers(page: pageNumber);
    }catch(e){
      refreshController.loadFailed();
    }
  }

  Future<void> refreshData() async {
    try {
      wallpapers = [];
      await getWallpapers();
    }catch(e){
      refreshController.refreshFailed();
    }
  }

  bool isFavorite = false;
  favorite(bool value) {
    isFavorite = value;
    print(isFavorite.toString()+"///////////////////////////////");
    notifyListeners();
  }

  Future<void> requestPermission(BuildContext context) async {
    // Request permissions for Android versions requiring specific media permissions.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      if (await Permission.photos.isPermanentlyDenied) Permission.photos,
    ].request();

    final info = statuses[Permission.storage];

    // Show dialog if permission is permanently denied.
    if (info == PermissionStatus.permanentlyDenied) {
      _showPermissionDialog(context);
    }
  }

  void _showPermissionDialog(BuildContext context) {
    // if (!mounted) return;  // Ensure the widget is still in the tree.

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Text("Open app settings to grant storage access."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

/*
  requestPermission(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses =
    await [Permission.storage].request();

    final info = statuses[Permission.storage];

    //if user permanently denied permission, open app setting..
    if (info == PermissionStatus.permanentlyDenied) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Text("Open app setting to grant access."),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () async {
                    Navigator.pop(context);
                    openAppSettings();
                  },
                ),
                TextButton(
                  child: Text('Close'),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }
*/
  save(String url, BuildContext context) async {
    await requestPermission(context);
    var status = await Permission.storage.status.isGranted;
    if (status) {
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "photo");
      //print(result);
    }
  }

  Future<void> setwallpaper(String imageUrl) async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    final bool result =
    (await WallpaperManager.setWallpaperFromFile(file.path, location));
  }

}
