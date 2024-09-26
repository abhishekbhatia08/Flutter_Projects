// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:sign_up_app/data/repositories/api.dart';
// import 'package:sign_up_app/screens/user_details.dart';
// import 'package:sign_up_app/utils/url.constants.dart';
// import 'package:sign_up_app/widgets/custom_scackbar.dart';
// import 'package:sign_up_app/widgets/push_navigator.dart';

// class ServiceBookingRepo {
//   API api = API();
//   Future<void> listBookingServices(BuildContext context, File file) async {
//     try {
//       Response response = await api.sendRequest.post(
//         UrlConst.upload,
//         data: {
//           "file_input": file,
//         },
//       );
//       print(response);
//       if (response.body['message'] == "success") {
//         pushNavigator(context, const UserDetails());
//       } else {
//         toastShow(context, "Some Error Ocurred", "error");
//       }
//     } catch (ex) {
//       rethrow;
//     }
//   }
// }
