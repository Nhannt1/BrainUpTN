import 'package:json_annotation/json_annotation.dart';

part 'control_net_request.g.dart';

@JsonSerializable()
class ControlNetRequest {
  ControlNetRequest({
    this.model,
    this.guideImage,
    this.weight,
    this.controlMode,
    this.startStepPercentage,
    this.endStepPercentage,
  });

  @JsonKey(name: "model")
  final String? model;
  @JsonKey(name: "guideImage")
  final String? guideImage;
  @JsonKey(name: "weight")
  final double? weight;
  @JsonKey(name: "controlMode")
  final String? controlMode;
  @JsonKey(name: "startStepPercentage")
  final int? startStepPercentage;
  @JsonKey(name: "endStepPercentage")
  final int? endStepPercentage;

  factory ControlNetRequest.fromJson(Map<String, dynamic> json) => _$ControlNetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ControlNetRequestToJson(this);
}
