import 'package:brainup/data/model/base_data.dart';
import 'package:brainup/data/model/image_inference_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_response_image.g.dart';

@JsonSerializable()
class DataResponseImage extends BaseData {
  DataResponseImage({
    this.datas,
  });
  @JsonKey(name: "data")
  final List<ImageInferenceData>? datas;

  factory DataResponseImage.fromJson(Map<String, dynamic> json) => _$DataResponseImageFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseImageToJson(this);
}
