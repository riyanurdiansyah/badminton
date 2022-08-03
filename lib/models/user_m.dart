class UserModel {
  int? role;
  String? username;
  String? handphone;
  String? uid;
  String? email;
  bool? status;

  UserModel({
    this.role,
    this.username,
    this.handphone,
    this.uid,
    this.email,
    this.status,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    role = json['role'] ?? 1;
    username = json['username'] ?? '-';
    handphone = json['handphone'] ?? '-';
    email = json['email'] ?? '-';
    status = json['status'] ?? true;
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['username'] = username;
    data['handphone'] = handphone;
    data['role'] = role;
    data['status'] = status;
    data['uid'] = uid;
    return data;
  }
}
