import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
                  height: 150,
                ),
                Icon(
                  Icons.done,
                  size: 60,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Your account has been created",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}