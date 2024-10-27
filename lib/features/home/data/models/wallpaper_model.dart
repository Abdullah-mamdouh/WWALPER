import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
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
@HiveType(typeId: 0)
class Photos {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? width;
  @HiveField(2)
  int? height;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? photographer;


  @JsonKey(name: 'photographer_url')
  @HiveField(5)
  String? photographerUrl;

  @JsonKey(name: 'photographer_id')
  @HiveField(6)
  int? photographerId;

  @JsonKey(name: 'avg_color')
  @HiveField(7)
  String? avgColor;
  @HiveField(8)
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
@HiveType(typeId: 1)
class Src {
  @HiveField(0)
  String? original;

  @JsonKey(name: 'large2x')
  @HiveField(1)
  String? large2X; // Change field to camelCase for Dart convention
  @HiveField(2)
  String? large;
  @HiveField(3)
  String? medium;
  @HiveField(4)
  String? small;
  @HiveField(5)
  String? portrait;
  @HiveField(6)
  String? landscape;
  @HiveField(7)
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
