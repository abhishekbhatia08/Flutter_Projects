import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_up_app/data/bloc/user_cubit.dart';
import 'package:sign_up_app/data/bloc/user_state.dart';
import 'package:sign_up_app/data/model/user_model.dart';
import 'package:sign_up_app/data/services/user_services.dart';
import 'package:sign_up_app/utils/color_constants.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:sign_up_app/screens/pdf_screen.dart';
import 'package:sign_up_app/widgets/button.dart';
import 'package:sign_up_app/widgets/push_navigator.dart';

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
      body: 
      // BlocConsumer<UserCubit, UserState>(
      //     listener: (context, state) {},
      //     builder: (context, state) {
      //       if (state is UserInitial) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       if (state is UserLoaded) {
      //         {
      //           return 
                ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                
                return userDetailBox(context, firstName.toString(), lastName.toString(), email.toString(),phone.toString(), dob.toString(),fileName,pathPDF,);
              },
            ),);
          //     } 
          //   }
          //   return SizedBox(
          //       child: const Center(child: Text("No Saved Vehicle")));
          // }));
          }}

Widget detailsRow(
  BuildContext context,
  String keyText,
  String valueText,
) {
  return Row(
    children: [
      Text(
        "$keyText - ",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorConstants.secondary,
        ),
      ),
      customText(context, valueText),
    ],
  );
}

@override
Widget customText(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.secondary,
    ),
  );
}

@override
Widget userDetailBox(BuildContext context,String firstName,String lastName,String email,String phone,String dob,String fileName,String pathPDF) {
  return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          border: Border.all(
            color: ColorConstants.primary,
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsRow(context, "Name",
                "${firstName.toString()} ${lastName.toString()}"),
            detailsRow(context, "Email", email.toString()),
            detailsRow(context, "Phone No.", phone.toString()),
            detailsRow(context, "Date of Birth", dob.toString()),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(context, fileName),
                    CustomisedButton(
                      buttonText: "Open CV",
                      buttonColor: ColorConstants.primary,
                      textColor: ColorConstants.secondary,
                      onPressed: () {
                        if (pathPDF.isNotEmpty) {
                          pushNavigator(
                              context,
                              PDFScreen(
                                path: pathPDF,
                              ));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}