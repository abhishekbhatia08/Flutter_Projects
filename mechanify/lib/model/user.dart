class User {
  final String name;
  final String phone;

  User(this.name, this.phone);

  //constructor that convert json to object instance
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'];

  //a method that convert object to json
  Map<String, dynamic> toJson() => {'name': name, 'phone': phone};
}
