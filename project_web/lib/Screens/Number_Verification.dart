// ignore: file_names
import 'package:flutter/material.dart';
import 'package:project_web/Screens/OTP.dart';
import '../Widgets/NumberTextField.dart';

// ignore: use_key_in_widget_constructors
class NumberVerification extends StatefulWidget {
  @override
  State<NumberVerification> createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaHeight = MediaQuery.of(context).size.height;
    final MediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q="),
              fit: BoxFit.cover),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
              SizedBox(height: MediaHeight * 0.20),
              Text(
                'To login please enter your',
                style: TextStyle(
                    fontSize: 30 * curScaleFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1),
              ),
              Text(
                'Mobile Number',
                style: TextStyle(
                  fontSize: 35 * curScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: MediaHeight * 0.075),
              NumberTextField(10, MediaWidth),
              SizedBox(height: MediaHeight * 0.075),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaWidth * 0.07,
                  vertical: MediaHeight * 0.015,
                ),
                highlightColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => OTPScreen())));
                },
                color: Colors.red,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'NEXT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25 * curScaleFactor,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaHeight * 0.02),
              Text(
                'By proceeding, you agree to our',
                style: TextStyle(
                  fontSize: 20 * curScaleFactor,
                  color: Colors.black,
                  height: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 20 * curScaleFactor,
                    color: Colors.black,
                    height: 2,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                        text: 'Privacy & Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
