abstract class UserHeaderState {}

class UserInitial extends UserHeaderState {}

class UserLoading extends UserHeaderState {}

class UserLoaded extends UserHeaderState {
  final String fullname;
  final String imageUrl;

  UserLoaded({required this.fullname, required this.imageUrl});
}

class UserError extends UserHeaderState {
  final String message;

  UserError(this.message);
}
