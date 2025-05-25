import 'package:brainup/data/model/request_body/control_net_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_inference_request.g.dart';

@JsonSerializable()
class ImageInferenceRequest {
  ImageInferenceRequest({
    this.taskType,
    this.taskUUID,
    this.positivePrompt,
    this.model,
    this.seedImage,
    this.width,
    this.height,
    this.strength,
    this.numberResults,
    this.outputFormat,
    this.cFGScale,
    this.steps,
    this.scheduler,
    this.includeCost,
    this.outputQuality,
    this.controlNetRequests,
    this.clipSkip,
  });

  @JsonKey(name: "taskType")
  final String? taskType;
  @JsonKey(name: "taskUUID")
  final String? taskUUID;
  @JsonKey(name: "positivePrompt")
  final String? positivePrompt;
  @JsonKey(name: "clipSkip")
  final int? clipSkip;
  @JsonKey(name: "model")
  final String? model;
  @JsonKey(name: "seedImage")
  final String? seedImage;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "strength")
  final double? strength;
  @JsonKey(name: "numberResults")
  final int? numberResults;
  @JsonKey(name: "outputFormat")
  final String? outputFormat;
  @JsonKey(name: "CFGScale")
  final double? cFGScale;
  @JsonKey(name: "steps")
  final int? steps;
  @JsonKey(name: "scheduler")
  final String? scheduler;
  @JsonKey(name: "includeCost")
  final bool? includeCost;
  @JsonKey(name: "outputQuality")
  final int? outputQuality;
  @JsonKey(name: "controlNet")
  final List<ControlNetRequest>? controlNetRequests;

  factory ImageInferenceRequest.fromJson(Map<String, dynamic> json) => _$ImageInferenceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInferenceRequestToJson(this);
}
