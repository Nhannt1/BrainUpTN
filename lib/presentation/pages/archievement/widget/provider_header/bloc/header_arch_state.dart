import 'package:brainup/presentation/pages/archievement/widget/provider_header/model/model_header_arch.dart';

abstract class HeaderArchState {}

class HeaderArchInit extends HeaderArchState {}

class HeaderArchLoading extends HeaderArchState {}

class HeaderArchLoaded extends HeaderArchState {
  final UserModelArch userModelArch;

  HeaderArchLoaded({required this.userModelArch});
}

class HeaderArchError extends HeaderArchState {
  final String messing;

  HeaderArchError({required this.messing});
}
