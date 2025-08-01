class UserModel {
  final String uid;
  final String fullname;
  final String email;
  final String image;
  final String age;
  UserModel({
    required this.uid,
    required this.fullname,
    required this.email,
    required this.image,
    required this.age,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      fullname: map['fullname'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      age: map['age'] ?? '',
    );
  }
}
