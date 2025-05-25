import 'package:brainup/domain/model/base_model.dart';

abstract class BaseMapper<T, R extends BaseModel> {
  R map(T data);

  R? nullableMap(T? data) {
    return data != null ? map(data) : null;
  }

  List<R> collectionMap(List<T> collection) {
    return collection.map((data) => map(data)).toList();
  }

  List<R>? nullableCollectionMap(List<T>? collection) {
    return collection?.map((data) => map(data)).toList();
  }
}
