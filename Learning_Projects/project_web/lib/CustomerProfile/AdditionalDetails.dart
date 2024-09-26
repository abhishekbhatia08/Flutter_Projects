import 'package:flutter/material.dart';
import 'package:project_web/Screens/dashboard.dart';

class AdditionalDetailsPage extends StatefulWidget {
  const AdditionalDetailsPage({Key? key}) : super(key: key);

  @override
  _AdditionalDetailsPageState createState() => _AdditionalDetailsPageState();
}

class _AdditionalDetailsPageState extends State<AdditionalDetailsPage> {
  bool showPassword = false;
  String _dropDownValue = "Please Select";
  String _dropDownValue1 = "Select income  ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Please fill the additional information",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextField("Name as per PAN"),
              buildTextField("PAN Number"),
              const Text(
                "Customer category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              DropdownButton(
                // ignore: unnecessary_null_comparison
                hint: _dropDownValue == null
                    ? const Text('Dropdown')
                    : Text(
                        _dropDownValue,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                isExpanded: true,
                iconSize: 50.0,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                items: ['Un-employed', 'Salaried', 'Bussiness Man'].map(
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
              buildTextField("Company Name"),
              buildTextField("Company Address"),
              buildTextField("Monthly Income"),
              const SizedBox(height: 115),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Dashboard()))),
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "SUBMIT",
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

  Widget buildTextField(String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
