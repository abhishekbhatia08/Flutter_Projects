import 'package:flutter/material.dart';
import 'package:project_web/Screens/dashboard.dart';
import 'package:project_web/Widgets/ImageDialogBox.dart';

class Profile extends StatelessWidget {
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
        child: SetupProfilePage(),
      ),
    );
  }
}

class SetupProfilePage extends StatefulWidget {
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  String _dropDownValue = "Choose Your Gender";
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: MediaWidth * 0.2, top:MediaHeight*0.03, right:MediaWidth*0.2),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Hi",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ImageDialogBox())));
            },
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
          const SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromARGB(255, 10, 102, 177),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  buildTextField("First Name", "Enter Your First Name",
                      TextInputType.name),
                  buildTextField(
                      "Last Name", "Enter Your Last Name ", TextInputType.name),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gender",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DropdownButton(
                    dropdownColor: Color.fromARGB(255, 10, 102, 177),
                    focusColor: Color.fromARGB(255, 10, 102, 177),
                    hint: _dropDownValue == null
                        ? Text('Choose Your Gender',
                            style: TextStyle(
                                decorationColor: Colors.blue,
                                color: Colors.blue))
                        : Text(
                            _dropDownValue,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                    isExpanded: true,
                    iconSize: 30,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    items: ['Male', 'Female', 'Other'].map(
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
                  buildTextField("E-mail", "Enter Your E-mail",
                      TextInputType.emailAddress),
                  buildTextField("Mobile Number", "Enter your Mobile Number",
                      TextInputType.number),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Dashboard())));
                    },
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                          fontSize: 25, letterSpacing: 2, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, var type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        keyboardType: type,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 14 ,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            )),
      ),
    );
  }
}
