import 'package:brainup/data/model/data_response_image.dart';
import 'package:brainup/data/model/request_body/background_removal_request.dart';
import 'package:brainup/data/model/request_body/control_net_preprocess.dart';
import 'package:brainup/data/model/request_body/image_inference_request.dart';
import 'package:brainup/data/repository/source/remote/api/auth_api.dart';
import 'package:brainup/data/repository/source/remote/api/helper/api_ext.dart';

class ImageInferenceRemoteDataSource {
  ImageInferenceRemoteDataSource(this._authApi);
  final AuthApi _authApi;

  Future<DataResponseImage> generateImageToImage(ImageInferenceRequest request) async {
    final response = await _authApi.execute((api) => api.generateFromImageToImage([request]));
    return response;
  }

  Future<DataResponseImage> backgroundRemoval(BackgroundRemovalRequest request) async {
    final response = await _authApi.execute((api) => api.backgroundRemoval([request]));
    return response;
  }

  Future<DataResponseImage> controlNetPreprocess(ControlNetPreprocess request) async {
    final response = await _authApi.execute((api) => api.controlNetPreprocess([request]));
    return response;
  }
}
