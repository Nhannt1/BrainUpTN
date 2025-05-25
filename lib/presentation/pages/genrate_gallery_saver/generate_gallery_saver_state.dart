import 'package:brainup/domain/model/image_inference_model.dart';
import 'package:equatable/equatable.dart';

class GenerateGallerySaverState extends Equatable {
  final Map<String, List<ImageInferenceModel>>? datas;
  const GenerateGallerySaverState({
    this.datas,
  });

  GenerateGallerySaverState copyWith({
    Map<String, List<ImageInferenceModel>>? datas,
  }) {
    return GenerateGallerySaverState(
      datas: datas ?? this.datas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'datas': datas,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [datas];
}
