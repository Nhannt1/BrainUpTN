import 'package:brainup/presentation/pages/home/widgets/provider_your_group/model/model_group.dart';

abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoading extends GroupState {}

class GroupLoaded extends GroupState {
  final List<GroupModel> groups;

  GroupLoaded(this.groups);
}

class GroupError extends GroupState {
  final String message;

  GroupError(this.message);
}
