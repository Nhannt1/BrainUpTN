import 'package:brainup/domain/model/base_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends BaseModel with EquatableMixin {
  UserModel({
    this.userId,
    this.id,
    this.title,
    this.complete,
  });

  final int? userId;
  final int? id;
  final String? title;
  final bool? complete;

  UserModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? complete,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      complete: complete ?? this.complete,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [userId, id, title, complete];
}
