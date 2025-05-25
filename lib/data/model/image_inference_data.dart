import 'package:brainup/data/model/base_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_inference_data.g.dart';

@JsonSerializable()
class ImageInferenceData extends BaseData {
  ImageInferenceData({
    this.taskType,
    this.taskUUID,
    this.imageUUID,
    this.imageURL,
    this.cost,
    this.createAt,
    this.guideImageURL,
    this.guideImageUUID,
    this.bgColor,
  });

  @JsonKey(name: "taskType")
  final String? taskType;
  @JsonKey(name: "taskUUID")
  final String? taskUUID;
  @JsonKey(name: "imageUUID")
  final String? imageUUID;
  @JsonKey(name: "imageURL")
  final String? imageURL;
  @JsonKey(name: "cost")
  final double? cost;
  @JsonKey(name: "guideImageUUID")
  final String? guideImageUUID;
  @JsonKey(name: "guideImageURL")
  final String? guideImageURL;
  final String? createAt;
  final String? bgColor;

  factory ImageInferenceData.fromJson(Map<String, dynamic> json) => _$ImageInferenceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInferenceDataToJson(this);

  ImageInferenceData copyWith({
    String? taskType,
    String? taskUUID,
    String? imageUUID,
    String? imageURL,
    double? cost,
    String? createAt,
    String? bgColor,
  }) {
    return ImageInferenceData(
      taskType: taskType ?? this.taskType,
      taskUUID: taskUUID ?? this.taskUUID,
      imageUUID: imageUUID ?? this.imageUUID,
      imageURL: imageURL ?? this.imageURL,
      cost: cost ?? this.cost,
      createAt: createAt ?? this.createAt,
      bgColor: bgColor ?? this.bgColor,
    );
  }
}
