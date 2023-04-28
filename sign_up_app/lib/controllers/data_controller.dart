import 'package:get/get.dart';
import 'package:sign_up_app/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    print(response);
    if (response.statusCode == 200) {
      _myData = response.body;
      update();
      print("We Got Data");
    } else {
      print("We didn't get Data");
    }
  }
}
