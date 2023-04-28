// import 'package:dio/dio.dart';
// import 'package:sign_up_app/data/model/user_model.dart';

// class UserServices{
//   final String userDataUrl = "http://localhost:8080/get_users";
//   final Dio dio = Dio();

//   UserServices();

//   Future<List<User>> getUsers() async {
//     late List<User> users;
//     try {
//       final res = await dio.get(userDataUrl);
//       users = res.data['users'].map<User>((item)=>User.fromJson(item),).toList();
//     }
//     on DioError catch(e) {
//       users = [];
//     }
//     return users;
//   }
// }