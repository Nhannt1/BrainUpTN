import 'package:brainup/data/mapper/data_response_image_mapper.dart';
import 'package:brainup/data/model/request_body/background_removal_request.dart';
import 'package:brainup/data/model/request_body/control_net_preprocess.dart';
import 'package:brainup/data/model/request_body/image_inference_request.dart';
import 'package:brainup/data/repository/source/local/image_inference_local_data_source.dart';
import 'package:brainup/data/repository/source/remote/image_inference_remote_data_source.dart';
import 'package:brainup/domain/model/image_inference_model.dart';
import 'package:brainup/domain/repository/image_inference_repository.dart';
import 'package:intl/intl.dart';

class ImageRepositoryImpl extends ImageInferenceRepository {
  ImageRepositoryImpl(
    this._imageInferenceRemoteDataSource,
    this._dataResponseImageMapper,
    this._imageInferenceLocalDataSource,
  );

  final ImageInferenceRemoteDataSource _imageInferenceRemoteDataSource;
  final DataResponseImageMapper _dataResponseImageMapper;
  final ImageInferenceLocalDataSource _imageInferenceLocalDataSource;

  @override
  Future<List<ImageInferenceModel>> generateImageToImage(
    ImageInferenceRequest request,
    bool isBackgroundRemove,
  ) async {
    final data = await _imageInferenceRemoteDataSource.generateImageToImage(request);
    final response = _dataResponseImageMapper.map(data).datas ?? [];
    if (!isBackgroundRemove) {
      final firstImageInference = data.datas?.firstOrNull;
      if (firstImageInference != null) {
        final now = DateTime.now();
        final formattedDate = DateFormat('dd/MM/yyyy').format(now);
        await _imageInferenceLocalDataSource.insertImageInference(firstImageInference.copyWith(
          createAt: formattedDate,
          bgColor: "",
        ));
      }
    }

    return response;
  }

  @override
  Future<Map<String, List<ImageInferenceModel>>> getImageInferencesByDate() async {
    final entities = await _imageInferenceLocalDataSource.getImageInferencesByDate();
    return entities.map(
      (date, entityList) {
        final modelList = entityList.map((entity) => ImageInferenceModel.fromEntity(entity)).toList();
        return MapEntry(date, modelList);
      },
    );
  }

  @override
  Future<List<ImageInferenceModel>> backgroundRemoval(
    BackgroundRemovalRequest request,
    bool isSaveToLocal,
    String? bgColor,
  ) async {
    final data = await _imageInferenceRemoteDataSource.backgroundRemoval(request);
    final response = _dataResponseImageMapper.map(data).datas ?? [];
    if (isSaveToLocal) {
      final firstImageInference = data.datas?.firstOrNull;
      if (firstImageInference != null) {
        final now = DateTime.now();
        final formattedDate = DateFormat('dd/MM/yyyy').format(now);
        await _imageInferenceLocalDataSource.insertImageInference(firstImageInference.copyWith(
          createAt: formattedDate,
          bgColor: bgColor,
        ));
      }
    }
    return response;
  }

  @override
  Future<List<ImageInferenceModel>> controlNetPreprocess(ControlNetPreprocess request) async {
    final data = await _imageInferenceRemoteDataSource.controlNetPreprocess(request);
    final response = _dataResponseImageMapper.map(data).datas ?? [];
    return response;
  }
}
