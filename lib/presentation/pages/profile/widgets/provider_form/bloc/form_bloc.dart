import 'package:brainup/presentation/pages/profile/widgets/provider_form/bloc/form_event.dart';
import 'package:brainup/presentation/pages/profile/widgets/provider_form/bloc/form_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormBloc extends Bloc<FormEvent, FormStatee> {
  FormBloc() : super(FormInitial()) {
    on<LoadForm>(_onLoadForm);
  }
  Future<void> _onLoadForm(LoadForm event, Emitter<FormStatee> emit) async {
    emit(FormLoading());
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(event.id)
          .get();
      if (!doc.exists) {
        emit(FormError("User not found"));
        return;
      }
      final data = doc.data()!;
      final fullname = data['fullname'] ?? 'Unknown';
      final age = data['age']?.toString() ?? '';
      final email = data['email'] ?? '';
      print('Loaded age from Firestore: ${data['age']}');
      emit(FormLoaded(fullname: fullname, age: age, email: email));
    } catch (e) {
      emit(FormError("Failed to load user: $e"));
    }
  }
}
