import 'package:flutter/material.dart';
import '../Widgets/PinTextField.dart';
import 'package:project_web/Screens/profile.dart';

class Passcode extends StatefulWidget {
  @override
  State<Passcode> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q="),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaWidth * 0.1, vertical: MediaHeight * 0.1),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "For additional security, Please fill in this confidential information.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20 * curScaleFactor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: MediaHeight * 0.03),
                  Text(
                    "Set your Passcode",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20 * curScaleFactor),
                  ),
                  SizedBox(height: MediaHeight * 0.05),
                  PassCodeTextField(context),
                  SizedBox(height: MediaHeight * 0.05),
                  Text(
                    "Confirm Passcode",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20 * curScaleFactor),
                  ),
                  SizedBox(height: MediaHeight * 0.05),
                  PassCodeTextField(context),
                  SizedBox(height: MediaHeight * 0.05),
                  Text(
                    "Please enter no. of your choice and confirm your Passcode",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15 * curScaleFactor),
                  ),
                  SizedBox(height: MediaHeight * 0.05),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaWidth * 0.07,
                      vertical: MediaHeight * 0.015,
                    ),
                    highlightColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Profile())));
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
                ]),
          ),
        ),
      ),
    );
  }
}
