import 'package:drift/drift.dart';

@DataClassName('MessagesData')
class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get textMessage => text()();
  TextColumn get time => text()();
  BoolColumn get isUser => boolean()();
  TextColumn get imagePath => text().nullable()();
}
