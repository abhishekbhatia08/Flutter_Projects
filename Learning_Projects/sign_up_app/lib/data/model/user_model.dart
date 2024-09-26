class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? dob;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.dob});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['dob'] = dob;
    return data;
  }
}

