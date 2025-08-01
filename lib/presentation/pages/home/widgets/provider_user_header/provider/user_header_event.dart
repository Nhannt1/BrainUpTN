abstract class UserHeaderEvent {}

class LoadUser extends UserHeaderEvent {
  final String uid;

  LoadUser(this.uid);
}
