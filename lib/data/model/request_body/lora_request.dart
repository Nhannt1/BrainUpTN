import 'package:json_annotation/json_annotation.dart';

part 'lora_request.g.dart';

@JsonSerializable()
class LoraRequest {
  LoraRequest({
    this.model,
    this.weight,
  });
  @JsonKey(name: "model")
  final String? model;
  @JsonKey(name: "weight")
  final int? weight;

  factory LoraRequest.fromJson(Map<String, dynamic> json) => _$LoraRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoraRequestToJson(this);
}
