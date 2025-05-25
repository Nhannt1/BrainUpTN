import 'package:brainup/data/repository/source/local/api/app_database.dart';
import 'package:brainup/domain/model/base_model.dart';
import 'package:equatable/equatable.dart';

class ImageInferenceModel extends BaseModel with EquatableMixin {
  ImageInferenceModel({
    this.taskType,
    this.taskUUID,
    this.imageUUID,
    this.imageURL,
    this.createAt,
    this.cost,
    this.guideImageUUID,
    this.guideImageURL,
    this.bgColor,
  });
  final String? taskType;
  final String? taskUUID;
  final String? imageUUID;
  final String? imageURL;
  final String? createAt;
  final double? cost;
  final String? guideImageUUID;
  final String? guideImageURL;
  final String? bgColor;

  ImageInferenceModel copyWith({
    String? taskType,
    String? taskUUID,
    String? imageUUID,
    String? imageURL,
    String? createAt,
    double? cost,
    String? guideImageUUID,
    String? guideImageURL,
    String? bgColor,
  }) {
    return ImageInferenceModel(
        taskType: taskType ?? this.taskType,
        taskUUID: taskUUID ?? this.taskUUID,
        imageUUID: imageUUID ?? this.imageUUID,
        imageURL: imageURL ?? this.imageURL,
        createAt: createAt ?? this.createAt,
        cost: cost ?? this.cost,
        guideImageUUID: guideImageUUID ?? this.guideImageUUID,
        guideImageURL: guideImageURL ?? this.guideImageURL,
        bgColor: bgColor ?? this.bgColor);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      taskType,
      taskUUID,
      imageUUID,
      imageURL,
      createAt,
      cost,
      guideImageUUID,
      guideImageURL,
      bgColor,
    ];
  }

  factory ImageInferenceModel.fromEntity(ImageInferenceEntity entity) {
    return ImageInferenceModel(
      taskType: entity.taskType,
      taskUUID: entity.taskUUID,
      imageUUID: entity.imageUUID,
      imageURL: entity.imageURL,
      cost: entity.cost,
      createAt: entity.createdAt,
      bgColor: entity.bgColor,
    );
  }
}
