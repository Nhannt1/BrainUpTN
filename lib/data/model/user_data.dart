import 'package:brainup/data/model/base_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends BaseData {
  UserData({
    this.userId,
    this.id,
    this.title,
    this.complete,
  });

  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "complete")
  final bool? complete;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
