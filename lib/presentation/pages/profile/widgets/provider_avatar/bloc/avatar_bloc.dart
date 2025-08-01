import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'avatar_event.dart';
import 'avatar_sate.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarSate> {
  final ImagePicker _picker = ImagePicker();

  AvatarBloc() : super(AvatarInit()) {
    on<LoadAvatar>(_onLoadAvatar);
    on<PickAvatarImage>(_onPickAvatarImage);
  }

  Future<void> _onLoadAvatar(LoadAvatar event, Emitter<AvatarSate> emit) async {
    emit(AvatarLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final localPath = prefs.getString('avatar_local_path');

      if (localPath != null && File(localPath).existsSync()) {
        emit(AvatarLoaded(imageUrl: '', localFile: File(localPath)));
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(event.uid)
          .get();

      if (!doc.exists) {
        emit(AvatarErorr(messing: "User not found"));
        return;
      }

      final data = doc.data()!;
      final imageUrl = data['image'] ?? '';
      emit(AvatarLoaded(imageUrl: imageUrl, localFile: null));
    } catch (e) {
      emit(AvatarErorr(messing: "Failed to load avatar: $e"));
    }
  }

  Future<void> _onPickAvatarImage(
      PickAvatarImage event, Emitter<AvatarSate> emit) async {
    try {
      final picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        final file = File(picked.path);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('avatar_local_path', file.path);
        emit(AvatarLoaded(imageUrl: '', localFile: file));
      }
    } catch (e) {
      emit(AvatarErorr(messing: "Failed to pick image: $e"));
    }
  }
}
