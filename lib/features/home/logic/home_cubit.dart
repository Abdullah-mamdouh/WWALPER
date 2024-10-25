import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wwalper_app/features/home/data/home_repo.dart';
import 'package:wwalper_app/features/home/data/models/wallpaper_model.dart';

import '../../../core/networking/internet_checker.dart';
import '../../../core/utils/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.wallpaperRepo, this.internetChecker)
      : super(const HomeState.initial());
  final WallpaperRepo wallpaperRepo;
  final InternetCheckerImpl internetChecker;

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  final refreshController = RefreshController();

  static List<PhotosModel> wallpapers = [];
  void emitGetWallpapersStates({
    String? category,
    int? page,
  }) async {
    emit(const HomeState.loading());
    // if(await internetChecker.isConnected){
    final response = await wallpaperRepo.getWallpapers(
        page: page ?? Random().nextInt(100),
        category:
            category ?? ConstantsText.categoriesList[Random().nextInt(11)]);
    response.when(success: (response) {
      emit(HomeState.success(response));
      wallpapers = response;
    }, failure: (error) {
      emit(HomeState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //
    // }
  }

  // void emitCachedHomeStates() async{
  //   emit(const HomeState.isConnected());
  //   emit(const HomeState.loading());
  //   final response = await wallpaperLocalRepo.getCachedHome();
  //   response.when(
  //       success: (response) {
  //         emit(HomeState.success(response));
  //         wallpapers = response;
  //         //wallpaperLocalRepo.cacheHome(response);
  //       }, failure: (error) {
  //     emit(HomeState.error(error: error.errorModel.message ?? ''));
  //   });
  // }

  void getWallpapers({
    String? category,
    int? page,
  }) async {
    if (await internetChecker.isConnected) {
      emitGetWallpapersStates();
    } else {
      emit(HomeState.noInternet());
    }
  }

  Future<void> loadMoreData(int pageNumber) async {
    debugPrint("+++++++++++++++++++++++++++++++");
    debugPrint("Finish Scroll");
    // state is GetAllProductsPaginationError
    //     ? debugPrint("Not Add Item Count")
    //     : itemCount++;
    debugPrint("-------------------------------");
    debugPrint(pageNumber.toString());
    getWallpapers(page: pageNumber);
  }

  Future<void> refreshData() async {
    debugPrint("refresh data");
    getWallpapers();
    // await fetchAllProducts(
    //   context: context,
    //   type: type,
    //   isRefresh: true,
    // );
  }
}
