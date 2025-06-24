import 'dart:io';
import 'package:brainup/data/source/local/message.dart';
import 'package:brainup/domain/model_ai/message_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [Messages])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  Future<List<MessagesData>> getMessages(String userId) {
    return (select(messages)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.id)]))
        .get();
  }

  Future<int> insertMessage(MessagesCompanion message) {
    return into(messages).insert(message);
  }

  Future<int> deleteMessages(String userId) {
    return (delete(messages)..where((tbl) => tbl.userId.equals(userId))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'chat.db');
    return NativeDatabase(File(path));
  });
}
