class UserModel {
  int? role;
  String? name;
  String? handphone;
  String? uid;
  String? email;
  bool? status;
  List<Vaksin>? vaksin;

  UserModel({
    this.role,
    this.name,
    this.handphone,
    this.uid,
    this.email,
    this.status,
    this.vaksin,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    role = json['role'] ?? 1;
    name = json['name'] ?? '-';
    handphone = json['handphone'] ?? '-';
    email = json['email'] ?? '-';
    status = json['status'] ?? true;
    uid = json['uid'];
    vaksin = List.from(
      json["vaksin"].map(
        (x) => Vaksin.fromJson(x),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['name'] = name;
    data['handphone'] = handphone;
    data['role'] = role;
    data['status'] = status;
    data['uid'] = uid;
    return data;
  }
}

class Vaksin {
  Vaksin({
    this.title,
    this.status,
  });

  String? title;
  bool? status;

  Vaksin.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
