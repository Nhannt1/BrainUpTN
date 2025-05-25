import 'package:brainup/data/model/data_response_image.dart';
import 'package:brainup/data/model/request_body/background_removal_request.dart';
import 'package:brainup/data/model/request_body/control_net_preprocess.dart';
import 'package:brainup/data/model/request_body/image_inference_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/v1')
  Future<DataResponseImage> generateFromImageToImage(
    @Body() List<ImageInferenceRequest> requests,
  );

  @POST('/v1')
  Future<DataResponseImage> backgroundRemoval(
    @Body() List<BackgroundRemovalRequest> requests,
  );

  @POST('/v1')
  Future<DataResponseImage> controlNetPreprocess(
    @Body() List<ControlNetPreprocess> requests,
  );
}
