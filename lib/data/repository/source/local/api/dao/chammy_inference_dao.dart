import 'package:brainup/data/repository/source/local/entities/ImageInferenceEntities.dart';
import 'package:drift/drift.dart';

import '../app_database.dart';

part 'chammy_inference_dao.g.dart';

@DriftAccessor(tables: [ImageInferenceEntities])
class ChammyInferenceDao extends DatabaseAccessor<AppDatabase> with _$ChammyInferenceDaoMixin {
  ChammyInferenceDao(super.db);

  Future<void> insertImage(ImageInferenceEntitiesCompanion image) => into(imageInferenceEntities).insert(image);

  Future<List<ImageInferenceEntity>> getAllImagesSorted() {
    return (select(imageInferenceEntities)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .get();
  }

  Future<Map<String, List<ImageInferenceEntity>>> getGroupedByDate() async {
    final allImages = await getAllImagesSorted();
    final Map<String, List<ImageInferenceEntity>> grouped = {};
    for (var img in allImages) {
      final date = img.createdAt ?? 'Unknown';
      grouped.putIfAbsent(date, () => []).add(img);
    }
    return grouped;
  }
}
