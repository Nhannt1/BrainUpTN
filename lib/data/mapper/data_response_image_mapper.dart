import 'package:brainup/data/mapper/base_mapper.dart';
import 'package:brainup/data/mapper/image_inference_mapper.dart';
import 'package:brainup/data/model/data_response_image.dart';
import 'package:brainup/domain/model/data_response_image_model.dart';

class DataResponseImageMapper extends BaseMapper<DataResponseImage, DataResponseImageModel> {
  DataResponseImageMapper(
    this._imageInferenceMapper,
  );
  final ImageInferenceMapper _imageInferenceMapper;

  @override
  DataResponseImageModel map(DataResponseImage data) {
    return DataResponseImageModel(
      datas: _imageInferenceMapper.nullableCollectionMap(data.datas),
    );
  }
}
