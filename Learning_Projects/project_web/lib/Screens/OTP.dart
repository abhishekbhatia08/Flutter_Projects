import 'package:flutter/material.dart';
import 'package:project_web/Screens/Passcode.dart';
import 'package:project_web/Widgets/NumberTextField.dart';

class OTPScreen extends StatefulWidget {
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
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
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaHeight * 0.20),
              Text(
                'Verification ',
                style: TextStyle(
                    fontSize: 50 * curScaleFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1),
              ),
              Text(
                'Enter Verification OTP sent to ',
                style: TextStyle(
                  fontSize: 25 * curScaleFactor,
                  color: Colors.black,
                  height: 2,
                ),
              ),
              Text(
                '+91-9654422129',
                style: TextStyle(
                    fontSize: 20 * curScaleFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 2),
              ),
              SizedBox(height: MediaHeight * 0.075),
              NumberTextField(4, MediaQuery.of(context).size.width),
              SizedBox(height: MediaHeight * 0.075),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaWidth * 0.07,
                  vertical: MediaHeight * 0.015,
                ),
                highlightColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Passcode())));
                },
                color: Colors.red,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'VERIFY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25 * curScaleFactor,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Resending OTP in 2:00 min ',
                style: TextStyle(
                    fontSize: 25 * curScaleFactor,
                    color: Colors.black,
                    height: 3),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
