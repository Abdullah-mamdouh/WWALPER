import 'package:json_annotation/json_annotation.dart';
part 'wallpaper_model.g.dart'; // Generated file

@JsonSerializable()
class PhotosModel {
  int? page;

  @JsonKey(name: 'per_page')
  int? perPage;

  List<Photos>? photos;

  @JsonKey(name: 'total_results')
  int? totalResults;

  @JsonKey(name: 'next_page')
  String? nextPage;

  PhotosModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  // Factory constructor to generate from JSON
  factory PhotosModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosModelFromJson(json);

  // Method to convert model to JSON
  Map<String, dynamic> toJson() => _$PhotosModelToJson(this);
}

@JsonSerializable()
class Photos {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;

  @JsonKey(name: 'photographer_url')
  String? photographerUrl;

  @JsonKey(name: 'photographer_id')
  int? photographerId;

  @JsonKey(name: 'avg_color')
  String? avgColor;

  Src? src;

  Photos({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
  });

  // Factory constructor to generate from JSON
  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  // Method to convert model to JSON
  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}

@JsonSerializable()
class Src {
  String? original;

  @JsonKey(name: 'large2x')
  String? large2X; // Change field to camelCase for Dart convention

  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  // Factory constructor to generate from JSON
  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);

  // Method to convert model to JSON
  Map<String, dynamic> toJson() => _$SrcToJson(this);
}
