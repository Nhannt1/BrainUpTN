import 'package:drift/drift.dart';

class ImageInferenceEntities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskType => text().nullable()();
  TextColumn get taskUUID => text().nullable()();
  TextColumn get imageUUID => text().nullable()();
  TextColumn get imageURL => text().nullable()();
  RealColumn get cost => real().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get bgColor => text().nullable()();
}
