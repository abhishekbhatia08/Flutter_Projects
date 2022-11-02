import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mechanify/pages/login.dart';
import 'package:mechanify/pages/signup.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 15,
              color: Colors.grey,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/mechanify.png',
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/pic.png',
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Easy to find",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Nearby Garage",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Ready to use our top services ?",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.85,
                  height: 40,
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SignUpPage())));
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an Account ?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
