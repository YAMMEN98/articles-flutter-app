import 'package:json_annotation/json_annotation.dart';

part 'media_meta_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MediaMetaDataModel {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetaDataModel({this.url, this.format, this.height, this.width});

  factory MediaMetaDataModel.fromJson(json) =>
      _$MediaMetaDataModelFromJson(json);

  toJson() => _$MediaMetaDataModelToJson(this);

  static List<MediaMetaDataModel> fromJsonList(List json) {
    return json.map((e) => MediaMetaDataModel.fromJson(e)).toList();
  }
}
