import 'package:brainup/domain/error/error_entity.dart';

abstract class ErrorMapper {
  ErrorEntity map(Object? exception);
}
