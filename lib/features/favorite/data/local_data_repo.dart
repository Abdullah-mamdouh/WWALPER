import 'package:hive/hive.dart';

import '../../home/data/models/wallpaper_model.dart';

class LocalData {
  final Box<Photos> favoritePhotosBox = Hive.box<Photos>('favorite_photos');

  Future<void> addFavoritePhotos(Photos photo) async {
    await favoritePhotosBox.add(photo);
  }

  List<Photos> getFavoritePhotos() {
    return favoritePhotosBox.values.toList();
  }

  Future<void> removePhoto(int index) async {
    await favoritePhotosBox.deleteAt(index);
  }
}
