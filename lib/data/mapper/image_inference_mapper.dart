import 'package:brainup/data/mapper/base_mapper.dart';
import 'package:brainup/data/model/image_inference_data.dart';
import 'package:brainup/domain/model/image_inference_model.dart';

class ImageInferenceMapper extends BaseMapper<ImageInferenceData, ImageInferenceModel> {
  @override
  ImageInferenceModel map(ImageInferenceData data) {
    return ImageInferenceModel(
      taskType: data.taskType,
      taskUUID: data.taskUUID,
      imageUUID: data.imageUUID,
      imageURL: data.imageURL,
      cost: data.cost,
      guideImageURL: data.guideImageURL,
      guideImageUUID: data.guideImageUUID,
      bgColor: data.bgColor,
    );
  }
}
