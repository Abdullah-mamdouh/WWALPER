import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wwalper_app/features/home/data/models/wallpaper_model.dart';

import '../../../../../core/networking/api_service/api_constants.dart';
import '../../../core/networking/api_service/api_result.dart';
import '../../../core/networking/error_handler_base.dart';
part 'home_repo.g.dart';

@RestApi(baseUrl: ApiWallpaperConstants.baseUrl)
abstract class WallpaperApiRepo {
  factory WallpaperApiRepo(Dio dio, {String baseUrl}) = _WallpaperApiRepo;

  @GET('${ApiWallpaperConstants.photosSearchEndPoint}?query={category}&page={page}&per_page=10')
  Future<PhotosModel> getWallpapers(
      @Path('category') String category,
      @Path('page') dynamic page,
      );

  @GET('${ApiWallpaperConstants.photosSearchEndPoint}?query={category}')
  Future<PhotosModel> searchWallpaper(
      @Path('category') String category,
      );
}


class WallpaperRepo {

  final WallpaperApiRepo wallpaperApiRepo;

  WallpaperRepo({required this.wallpaperApiRepo});

  Future<ServiceResult<PhotosModel>> getWallpapers(
      {required String category, required dynamic page}) async{
    try {
      final response = await wallpaperApiRepo.getWallpapers(category, page);
      return ServiceResult.success(response);
    } catch (errro) {
      debugPrint("${errro}78888888888888888888888888888888888888");
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }
  }

  Future<ServiceResult<PhotosModel>> searchWallpapers(
      {required String category}) async{
    try {
      final response = await wallpaperApiRepo.searchWallpaper(category);
      return ServiceResult.success(response);
    } catch (errro) {
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }
  }

}