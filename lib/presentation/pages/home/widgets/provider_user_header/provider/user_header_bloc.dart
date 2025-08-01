import 'package:brainup/presentation/pages/home/widgets/provider_user_header/provider/user_header_event.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_user_header/provider/user_header_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserHeaderEvent, UserHeaderState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
  }

  Future<void> _onLoadUser(
      LoadUser event, Emitter<UserHeaderState> emit) async {
    emit(UserLoading());
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(event.uid)
          .get();
      if (!doc.exists) {
        emit(UserError("User not found"));
        return;
      }

      final data = doc.data()!;
      final fullname = data['fullname'] ?? 'Unknown';
      final imageUrl = data['image'] ?? '';

      emit(UserLoaded(fullname: fullname, imageUrl: imageUrl));
    } catch (e) {
      emit(UserError("Failed to load user: $e"));
    }
  }
}
