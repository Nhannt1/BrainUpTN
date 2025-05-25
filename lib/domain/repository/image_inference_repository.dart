import 'package:brainup/data/model/request_body/background_removal_request.dart';
import 'package:brainup/data/model/request_body/control_net_preprocess.dart';
import 'package:brainup/data/model/request_body/image_inference_request.dart';
import 'package:brainup/domain/model/image_inference_model.dart';

abstract class ImageInferenceRepository {
  Future<List<ImageInferenceModel>> generateImageToImage(
    ImageInferenceRequest request,
    bool isBackgroundRemove,
  );

  Future<List<ImageInferenceModel>> backgroundRemoval(
    BackgroundRemovalRequest request,
    bool isSaveToLocal,
    String? bgColor,
  );

  Future<List<ImageInferenceModel>> controlNetPreprocess(
    ControlNetPreprocess request,
  );

  Future<Map<String, List<ImageInferenceModel>>> getImageInferencesByDate();
}
