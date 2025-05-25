import 'package:brainup/data/mapper/base_mapper.dart';
import 'package:brainup/data/model/user_data.dart';
import 'package:brainup/domain/model/user_model.dart';

class UserMapper extends BaseMapper<UserData, UserModel> {
  @override
  UserModel map(UserData data) {
    return UserModel(
      userId: data.userId,
      id: data.id,
      title: data.title,
      complete: data.complete,
    );
  }
}
