import 'package:flutter/material.dart';
import 'package:wwalper_app/features/favorite/data/local_data_repo.dart';

import '../../home/data/models/wallpaper_model.dart';


class PhotosProvider extends ChangeNotifier {
  //late Box<Photos> _photosBox;
  final LocalData localData;
  List<Photos> _favoritePhotos = [];
  bool _isLoading = true;

  PhotosProvider({required this.localData}){
    _initializeBox();
  }

  List<Photos> get favoritePhotos => _favoritePhotos;
  bool get isLoading => _isLoading;

  // Initialize Hive box and load initial data
  Future<void> _initializeBox() async {
    //_photosBox = await Hive.openBox<Photos>('favorite_photos');
    _favoritePhotos = await localData.getFavoritePhotos();
    _isLoading = false;
    notifyListeners();
  }
  Future<void> getFavoritePhotos()async{
    _favoritePhotos = await localData.getFavoritePhotos();
    notifyListeners();
  }
  Future<void> addFavoritePhoto(Photos photo) async {
    await localData.addFavoritePhotos(photo);
    _favoritePhotos = await localData.getFavoritePhotos();
    notifyListeners();
  }

  Future<void> removePhoto(int index) async {
    // await _photosBox.deleteAt(index);
    await localData.removePhoto(index);
    _favoritePhotos = localData.getFavoritePhotos();
    notifyListeners();
  }
}
