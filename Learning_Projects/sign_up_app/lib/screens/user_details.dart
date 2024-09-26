import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_up_app/utils/color_constants.dart';
import 'package:sign_up_app/screens/pdf_screen.dart';
import 'package:sign_up_app/widgets/button.dart';
import 'package:sign_up_app/widgets/push_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sign_up_app/widgets/user_detail_box.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // final _userServices = UserServices();
  String firstName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String dob = "";
  String fileName = "";
  String pathPDF = "";
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('first_name').toString();
      lastName = prefs.getString('last_name').toString();
      phone = prefs.getString('mobile_no').toString();
      email = prefs.getString('email_id').toString();
      dob = prefs.getString('dob').toString();
      fileName = prefs.getString('cv_file_name').toString();
      pathPDF = prefs.getString('file_path').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: ColorConstants.secondary),
        title: const Text(
          "User Details",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: ColorConstants.secondary,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: ColorConstants.primary,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((userData) {
              return UserDetailsBox(
                firstName: userData["firstName"],
                lastName: userData["lastName"],
                email: userData["email"],
                phone: userData["phone"].toString(),
                dob: userData["dob"],
                pathPDF: userData["cv"],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
