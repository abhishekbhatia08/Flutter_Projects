import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mechanify/model/user.dart';
import 'package:mechanify/pages/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialGetSaved();
  }

  void initialGetSaved() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // Read the data, decode it and store it in map structure
    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('userdata'));
    var user = User.fromJson(jsondatais);
    if (jsondatais.isNotEmpty) {
      print(user.name);
      print(user.phone);
      _name.value = TextEditingValue(text: user.name);
      _phone.value = TextEditingValue(text: user.phone);
    }
  }

  void storeUserData() {
    //store the user entered data in user object
    User user1 = new User(_name.text, _phone.text);
    // encode / convert object into json string
    String user = jsonEncode(user1);
    print(user);
    //save the data into sharedPreferences using key-value pairs
    sharedPreferences.setString('userdata', user);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SuccessPage(),
    ));
  }

  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Column(
                  children: [
                    Image.asset(
                      'assets/images/mechanify.png',
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create an account with Basic Details",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        controller: _phone,
                        decoration:
                            new InputDecoration(labelText: "Mobile No."),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.85,
                  height: 40,
                  onPressed: () {
                    storeUserData();
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
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
