abstract class HeaderArchEvent {}

class LoadUserData extends HeaderArchEvent {
  final String uid;

  LoadUserData({required this.uid});
}
