import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:brainup/config/env.dart';
import 'package:brainup/data/mapper/data_response_image_mapper.dart';
import 'package:brainup/data/mapper/image_inference_mapper.dart';
import 'package:brainup/data/repository/source/image_inference_repository_impl.dart';
import 'package:brainup/data/repository/source/local/api/app_database.dart';
import 'package:brainup/data/repository/source/local/api/dao/brain_up_dao.dart';
import 'package:brainup/data/repository/source/local/image_inference_local_data_source.dart';
import 'package:brainup/data/repository/source/local/user_local_data_source.dart';
import 'package:brainup/data/repository/source/remote/api/auth_api.dart';
import 'package:brainup/data/repository/source/remote/api/middleware/auth_interceptor.dart';
import 'package:brainup/data/repository/source/remote/api/middleware/basic_auth_interceptor.dart';
import 'package:brainup/data/repository/source/remote/api/middleware/connectivity_interceptor.dart';
import 'package:brainup/data/repository/source/remote/api/middleware/refresh_token_interceptor.dart';
import 'package:brainup/data/repository/source/remote/api/none_auth_api.dart';
import 'package:brainup/data/repository/source/remote/image_inference_remote_data_source.dart';
import 'package:brainup/domain/repository/image_inference_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependenceInjection() async {
  // 🗂️ 1. Register Dio into GetIt first
  getIt.registerLazySingleton<Dio>(() {
    return Dio(BaseOptions(baseUrl: Env.baseUrl));
  });

  // 🗂️ 2. Register SharedPreferences, AppDatabase & SecureStorage
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<BrainUpDao>(
    () => getIt<AppDatabase>().brainUpDao,
  );

  // 🧠 3. Register local data sources
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSource(
      getIt<SharedPreferences>(),
      getIt<FlutterSecureStorage>(),
    ),
  );
  getIt.registerLazySingleton<ImageInferenceLocalDataSource>(
    () => ImageInferenceLocalDataSource(getIt<BrainUpDao>()),
  );

  // 🌐 4. Register NoneAuthApi first (used in refresh interceptor)
  getIt.registerLazySingleton<NoneAuthApi>(() {
    final dio = getIt<Dio>(); // Use the Dio instance from GetIt
    return NoneAuthApi(dio);
  });

  // 🔐 5. Register AuthApi with all interceptors
  getIt.registerLazySingleton<AuthApi>(() {
    final dio = getIt<Dio>(); // Use the Dio instance from GetIt
    dio.interceptors.addAll([
      const ConnectivityInterceptor(),
      BasicAuthInterceptor(),
      AuthInterceptor(),
      RefreshTokenInterceptor(
        getIt<UserLocalDataSource>(),
        dio,
      ),
      AwesomeDioInterceptor(),
    ]);
    return AuthApi(dio);
  });

  // 📦 6. Register remote data source
  getIt.registerLazySingleton<ImageInferenceRemoteDataSource>(
    () => ImageInferenceRemoteDataSource(getIt<AuthApi>()),
  );

  // 🔁 7. Register mappers
  getIt.registerLazySingleton<ImageInferenceMapper>(
      () => ImageInferenceMapper());
  getIt.registerLazySingleton<DataResponseImageMapper>(
    () => DataResponseImageMapper(getIt<ImageInferenceMapper>()),
  );

  // 📡 8. Register repository
  getIt.registerLazySingleton<ImageInferenceRepository>(
    () => ImageRepositoryImpl(
        getIt<ImageInferenceRemoteDataSource>(),
        getIt<DataResponseImageMapper>(),
        getIt<ImageInferenceLocalDataSource>()),
  );
}
