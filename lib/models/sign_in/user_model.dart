// lib/models/user_model.dart
class UserModel {
  String? uid;
  String? email;
  String? name;
  String? role;

  UserModel({this.uid, this.email, this.name, this.role});

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'name': name,
    'role': role,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
    );
  }
}
