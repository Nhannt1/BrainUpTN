abstract class AvatarEvent {}

class LoadAvatar extends AvatarEvent {
  final String uid;

  LoadAvatar({required this.uid});
}

class PickAvatarImage extends AvatarEvent {}
