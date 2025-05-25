import 'package:json_annotation/json_annotation.dart';

part 'control_net_preprocess.g.dart';

@JsonSerializable()
class ControlNetPreprocess {
  ControlNetPreprocess({
    this.taskType,
    this.taskUUID,
    this.model,
    this.outputFormat,
    this.outputType,
    this.width,
    this.height,
    this.inputImage,
    this.preProcessorType,
    this.includeHandsAndFaceOpenPose,
  });
  @JsonKey(name: "taskType")
  final String? taskType;
  @JsonKey(name: "taskUUID")
  final String? taskUUID;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "model")
  final String? model;
  @JsonKey(name: "outputFormat")
  final String? outputFormat;
  @JsonKey(name: "inputImage")
  final String? inputImage;
  @JsonKey(name: "outputType")
  final String? outputType;
  @JsonKey(name: "preProcessorType")
  final String? preProcessorType;
  @JsonKey(name: "includeHandsAndFaceOpenPose")
  final String? includeHandsAndFaceOpenPose;

  factory ControlNetPreprocess.fromJson(Map<String, dynamic> json) => _$ControlNetPreprocessFromJson(json);

  Map<String, dynamic> toJson() => _$ControlNetPreprocessToJson(this);
}
