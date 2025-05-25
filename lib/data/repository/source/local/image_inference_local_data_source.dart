import 'package:brainup/data/model/image_inference_data.dart';
import 'package:brainup/data/repository/source/local/api/app_database.dart';
import 'package:brainup/data/repository/source/local/api/dao/brain_up_dao.dart';
import 'package:drift/drift.dart';

class ImageInferenceLocalDataSource {
  ImageInferenceLocalDataSource(this._dao);

  final BrainUpDao _dao;

  Future<void> insertImageInference(ImageInferenceData data) async {
    await _dao.insertImage(ImageInferenceEntitiesCompanion.insert(
      taskType: Value(data.taskType),
      taskUUID: Value(data.taskUUID),
      imageUUID: Value(data.taskUUID),
      createdAt: Value(data.createAt),
      imageURL: Value(data.imageURL),
      cost: Value(data.cost),
      bgColor: Value(data.bgColor),
    ));
  }

  Future<Map<String, List<ImageInferenceEntity>>> getImageInferencesByDate() async {
    return _dao.getGroupedByDate();
  }
}
