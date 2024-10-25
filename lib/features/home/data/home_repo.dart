import 'package:dio/dio.dart';
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
  Future<List<PhotosModel>> getWallpapers(
      @Path('query') String category,
      @Path('page') String page,
      );

}


class WallpaperRepo {

  final WallpaperApiRepo wallpaperApiRepo;

  WallpaperRepo({required this.wallpaperApiRepo});

  Future<ServiceResult<List<PhotosModel>>> getWallpapers(
      {required String category, required dynamic page}) async{
    try {
      final response = await wallpaperApiRepo.getWallpapers(category, page);
      return ServiceResult.success(response);
    } catch (errro) {
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }
  }

}