// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_web/CustomerProfile/Address.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  String _dropDownValue = "Choose Your Gender";
  String _dropDownValue1 = "Please Select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q="),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(left: 50, top: 25, right: 25),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Customer Profile",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
              GestureDetector(
                
                child: Container(
                  width: 130,
                  height: 100,
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 102, 177),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(onPressed: () {}, child: Text("Edit")),
              const SizedBox(height: 20),
              Divider(
                thickness: 1,
                color: Colors.black45,
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Icon(
                    Icons.perm_identity,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text("Personal Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              const SizedBox(height: 10),
              buildTextField("First Name", "Enter Your First Name"),
              buildTextField("Last  Name", "Enter Your Last Name "),
              const Text("Gender"),
              DropdownButton(
                // ignore: unnecessary_null_comparison
                hint: _dropDownValue == null
                    ? const Text('Dropdown')
                    : Text(
                        _dropDownValue,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                isExpanded: true,
                iconSize: 50.0,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                items: ['Male', 'Female', 'Transgender'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val as String;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              buildTextField("E-mail", "Enter Your E-mail"),
              buildTextField("Mobile Number", "Enter your mobile number"),
              const Text("Language"),
              DropdownButton(
                // ignore: unnecessary_null_comparison
                hint: _dropDownValue1 == null
                    ? const Text('Dropdown')
                    : Text(
                        _dropDownValue1,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                isExpanded: true,
                iconSize: 50.0,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                items: ['Hindi', 'English', 'Tamil', 'Gujrati','Punjabi','Telugu','Marathi','Bengali'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue1 = val as String;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                 onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AddressPage()))),
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            )),
      ),
    );
  }
}
