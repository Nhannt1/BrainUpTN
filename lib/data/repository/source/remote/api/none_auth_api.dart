import 'package:brainup/data/model/user_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'none_auth_api.g.dart';

@RestApi()
abstract class NoneAuthApi {
  factory NoneAuthApi(Dio dio) = _NoneAuthApi;

  @GET("todos/{id}")
  Future<UserData> getUser(@Path("id") int id);
}
