import 'dart:io';

abstract class AvatarSate {}

class AvatarInit extends AvatarSate {}

class AvatarLoading extends AvatarSate {}

class AvatarLoaded extends AvatarSate {
  final String imageUrl;
  final File? localFile;
  AvatarLoaded({required this.imageUrl, this.localFile});
}

// class AvatarPicked extends AvatarSate {
//   final File imageFile;
//   AvatarPicked({required this.imageFile});
// }

class AvatarErorr extends AvatarSate {
  final String messing;

  AvatarErorr({required this.messing});
}
