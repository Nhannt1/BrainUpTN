// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'background_removal_request.g.dart';

@JsonSerializable()
class BackgroundRemovalRequest {
  BackgroundRemovalRequest({
    this.taskType,
    this.taskUUID,
    this.model,
    this.outputFormat,
    this.outputType,
    this.outputQuality,
    this.inputImage,
  });
  @JsonKey(name: "taskType")
  final String? taskType;
  @JsonKey(name: "taskUUID")
  final String? taskUUID;
  @JsonKey(name: "model")
  final String? model;
  @JsonKey(name: "outputFormat")
  final String? outputFormat;
  @JsonKey(name: "inputImage")
  final String? inputImage;
  @JsonKey(name: "outputType")
  final String? outputType;
  @JsonKey(name: "outputQuality")
  final int? outputQuality;

  factory BackgroundRemovalRequest.fromJson(Map<String, dynamic> json) => _$BackgroundRemovalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundRemovalRequestToJson(this);

  BackgroundRemovalRequest copyWith({
    String? taskType,
    String? taskUUID,
    String? model,
    String? outputFormat,
    String? inputImage,
    String? outputType,
    int? outputQuality,
  }) {
    return BackgroundRemovalRequest(
      taskType: taskType ?? this.taskType,
      taskUUID: taskUUID ?? this.taskUUID,
      model: model ?? this.model,
      outputFormat: outputFormat ?? this.outputFormat,
      inputImage: inputImage ?? this.inputImage,
      outputType: outputType ?? this.outputType,
      outputQuality: outputQuality ?? this.outputQuality,
    );
  }
}
