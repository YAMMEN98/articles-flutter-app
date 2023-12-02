// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaMetaDataModel _$MediaMetaDataModelFromJson(Map<String, dynamic> json) =>
    MediaMetaDataModel(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$MediaMetaDataModelToJson(MediaMetaDataModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
    };
