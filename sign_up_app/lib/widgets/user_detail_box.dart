import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sign_up_app/screens/pdf_screen.dart';
import 'package:sign_up_app/utils/color_constants.dart';
import 'package:sign_up_app/widgets/button.dart';
import 'package:sign_up_app/widgets/push_navigator.dart';

class UserDetailsBox extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String dob;
  final String pathPDF;
  const UserDetailsBox({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.dob,
    required this.pathPDF,
  });

  @override
  State<UserDetailsBox> createState() => _UserDetailsBoxState();
}

class _UserDetailsBoxState extends State<UserDetailsBox> {
  openPdf(BuildContext context) async {
    var bytes = base64Decode(widget.pathPDF);
    final output = await getTemporaryDirectory();
    final filePath = File("${output.path}/cv.pdf");
    await filePath
        .writeAsBytes(bytes.buffer.asUint8List())
        .then((value) => pushNavigator(
            context,
            PDFScreen(
              path: "${output.path}/cv.pdf",
            )));
    debugPrint("File Path: ${output.path}/cv.pdf");
    // ignore: use_build_context_synchronously
  }

  @override
  Widget build(BuildContext context) {
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
              "${widget.firstName.toString()} ${widget.lastName.toString()}"),
          detailsRow(context, "Email", widget.email.toString()),
          detailsRow(context, "Phone No.", widget.phone.toString()),
          detailsRow(context, "Date of Birth", widget.dob.toString()),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomisedButton(
                    buttonText: "Open CV",
                    buttonColor: ColorConstants.primary,
                    textColor: ColorConstants.secondary,
                    onPressed: () {
                      if (widget.pathPDF.isNotEmpty) {
                        openPdf(context);
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
}

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
