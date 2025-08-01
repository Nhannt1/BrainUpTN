import 'package:brainup/presentation/pages/home/widgets/provider_your_group/bloc/your_group_event.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/bloc/your_group_state.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/model/model_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final FirebaseFirestore firestore;
  GroupBloc(this.firestore) : super(GroupInitial()) {
    on<LoadGroups>(
      (event, emit) async {
        emit(GroupLoading());
        try {
          final snapshot = await firestore.collection('subject_group').get();
          final groups = snapshot.docs
              .map((doc) => GroupModel.fromJson(doc.data()))
              .toList();
          emit(GroupLoaded(groups));
        } catch (e) {
          emit(GroupError('Failed to load groups'));
        }
      },
    );
  }
}
