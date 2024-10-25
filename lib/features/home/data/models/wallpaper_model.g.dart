// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosModel _$PhotosModelFromJson(Map<String, dynamic> json) => PhotosModel(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['total_results'] as num?)?.toInt(),
      nextPage: json['next_page'] as String?,
    );

Map<String, dynamic> _$PhotosModelToJson(PhotosModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'photos': instance.photos,
      'total_results': instance.totalResults,
      'next_page': instance.nextPage,
    };

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      id: (json['id'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      photographerUrl: json['photographer_url'] as String?,
      photographerId: (json['photographer_id'] as num?)?.toInt(),
      avgColor: json['avg_color'] as String?,
      src: json['src'] == null
          ? null
          : Src.fromJson(json['src'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'avg_color': instance.avgColor,
      'src': instance.src,
    };

Src _$SrcFromJson(Map<String, dynamic> json) => Src(
      original: json['original'] as String?,
      large2X: json['large2x'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
      portrait: json['portrait'] as String?,
      landscape: json['landscape'] as String?,
      tiny: json['tiny'] as String?,
    );

Map<String, dynamic> _$SrcToJson(Src instance) => <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2X,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
