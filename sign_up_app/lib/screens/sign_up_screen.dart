import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_app/utils/color_constants.dart';
import 'package:sign_up_app/screens/user_details.dart';
import 'package:sign_up_app/widgets/button.dart';
import 'package:sign_up_app/widgets/custom_scackbar.dart';
import 'package:sign_up_app/widgets/form_text_field.dart';
import 'package:sign_up_app/widgets/mobile_text_field.dart';
import 'package:sign_up_app/widgets/push_navigator.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:shared_preferences/shared_preferences.dart';

final DateTime today = DateTime.now();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  DateTime? dob;
  bool dobSelected = false;
  bool cvSelected = false;
  String cvPath = "";
  String fileName = "";

  requiredDetailsFilled() {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        dobSelected && cvSelected) {
      return true;
    } else {
      return false;
    }
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: today,
      initialDate: today,
    ).then((value) {
      if (today.difference(value!).inDays > (18 * 365)) {
        setState(() {
          dob = value;
          dobSelected = true;
        });
      } else {
        toastShow(context, "Must be 18 or above", "error");
      }
    });
  }

  Future<void> _uploadCV() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'doc']);
    if (result != null) {
      setState(() {
        fileName = result.names[0].toString();
        cvPath = result.paths.single.toString();
        cvSelected = true;
      });
    } else {
      toastShow(context, "No File Selected", "error");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              screenSize.height * 0.15,
              20,
              screenSize.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get on Board !",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: ColorConstants.secondary),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Create your profile to start your journey",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.secondary),
                  ),
                ),
                TextFieldWidget(
                  hintText: "Enter First Name",
                  labelText: "First Name",
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  maxLength: 20,
                  required: true,
                ),
                TextFieldWidget(
                  hintText: "Enter Last Name",
                  labelText: "Last Name",
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  maxLength: 20,
                  required: true,
                ),
                TextFieldWidget(
                  hintText: "Enter E-Mail ID",
                  labelText: "E-Mail ID",
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  required: true,
                ),
                MobileTextField(contoller: phoneNumber),
                GestureDetector(
                  onTap: () {
                    _showDatePicker();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          color: ColorConstants.kLabelTextColor,
                          style: BorderStyle.values[1]),
                    ),
                    child: Row(
                      children: [
                        Text(
                            dobSelected
                                ? DateFormat.yMMMMd().format(dob!)
                                : "Select DOB",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.secondary,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          color: ColorConstants.kLabelTextColor,
                          style: BorderStyle.values[1])),
                  child: Column(
                    children: [
                      CustomisedButton(
                        buttonText: "upload cv",
                        buttonColor: ColorConstants.primary,
                        textColor: ColorConstants.secondary,
                        onPressed: () {
                          _uploadCV();
                        },
                      ),
                      Visibility(
                        visible: cvSelected,
                        child: Text(
                          "$fileName Selected",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorConstants.secondary,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: CustomisedButton(
              buttonText: "submit",
              buttonColor: ColorConstants.secondary,
              textColor: ColorConstants.primary,
              onPressed:
               requiredDetailsFilled()
                  ?
                   () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setString('first_name', firstName.text);
                      preferences.setString('last_name', lastName.text);
                      preferences.setString('email_id', email.text);
                      preferences.setString('mobile_no', phoneNumber.text);
                      preferences.setString('cv_file_name', fileName);
                      preferences.setString('file_path', cvPath);
                      preferences
                          .setString('dob', DateFormat.yMMMMd().format(dob!))
                          .then((value) =>
                              pushNavigator(context, const UserDetails()));
                    }
                  : () {
                      toastShow(context, "Please Fill all the Required Details",
                          "error");
                    }),
        ),
      ),
    );
  }
}
