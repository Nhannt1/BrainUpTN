import 'package:brainup/presentation/pages/archievement/widget/provider_header/model/model_header_arch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepositoryAchivement {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModelArch> fetchUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    final data = doc.data();
    if (data == null) throw Exception("User not found");

    return UserModelArch.fromMap(data);
  }
}
