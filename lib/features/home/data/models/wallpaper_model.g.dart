// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotosAdapter extends TypeAdapter<Photos> {
  @override
  final int typeId = 0;

  @override
  Photos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photos(
      id: fields[0] as int?,
      width: fields[1] as int?,
      height: fields[2] as int?,
      url: fields[3] as String?,
      photographer: fields[4] as String?,
      photographerUrl: fields[5] as String?,
      photographerId: fields[6] as int?,
      avgColor: fields[7] as String?,
      src: fields[8] as Src?,
    );
  }

  @override
  void write(BinaryWriter writer, Photos obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.photographer)
      ..writeByte(5)
      ..write(obj.photographerUrl)
      ..writeByte(6)
      ..write(obj.photographerId)
      ..writeByte(7)
      ..write(obj.avgColor)
      ..writeByte(8)
      ..write(obj.src);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SrcAdapter extends TypeAdapter<Src> {
  @override
  final int typeId = 1;

  @override
  Src read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Src(
      original: fields[0] as String?,
      large2X: fields[1] as String?,
      large: fields[2] as String?,
      medium: fields[3] as String?,
      small: fields[4] as String?,
      portrait: fields[5] as String?,
      landscape: fields[6] as String?,
      tiny: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Src obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.large2X)
      ..writeByte(2)
      ..write(obj.large)
      ..writeByte(3)
      ..write(obj.medium)
      ..writeByte(4)
      ..write(obj.small)
      ..writeByte(5)
      ..write(obj.portrait)
      ..writeByte(6)
      ..write(obj.landscape)
      ..writeByte(7)
      ..write(obj.tiny);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SrcAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
