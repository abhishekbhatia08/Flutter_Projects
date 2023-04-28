import 'package:dio/dio.dart';
import 'package:sign_up_app/data/model/user_model.dart';
import 'package:sign_up_app/data/repositories/api.dart';
import 'package:sign_up_app/utils/url.constants.dart';


class UserRepo {
  API api = API();
  Future getUser() async {
    try {
      Response response = await api.sendRequest.get(
        UrlConst.getUser,
      );
     List<dynamic> userDataMaps = response.data;
     print(response);
      return userDataMaps.map((e) => UserModel.fromJson(e)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}