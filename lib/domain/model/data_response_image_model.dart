import 'package:brainup/domain/model/base_model.dart';
import 'package:brainup/domain/model/image_inference_model.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;

class DataResponseImageModel extends BaseModel with EquatableMixin {
  final List<ImageInferenceModel>? datas;
  DataResponseImageModel({
    this.datas,
  });

  DataResponseImageModel copyWith({
    List<ImageInferenceModel>? datas,
  }) {
    return DataResponseImageModel(
      datas: datas ?? this.datas,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [datas];
}
