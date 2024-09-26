import 'package:flutter/material.dart';
import 'package:project_web/CustomerProfile/AdditionalDetails.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool showPassword = false;
  String _dropDownValue = "Choose Your City";
  String _dropDownValue1 = "Choose Your Gender";
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
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: const [
                      Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Text("Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextField("Address line 1"),
              buildTextField("Address line 2"),
              buildTextField("Locality"),
              buildTextField("Pincode"),
              const Text(
                "City",
                style: TextStyle(
                  fontSize: 20,
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
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                isExpanded: true,
                iconSize: 50.0,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                items: ['Delhi', 'Gurugram', 'Noida', 'Greater Noida'].map(
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
              const Text(
                "State",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
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
                items: [
                  'Delhi',
                  'Haryana',
                  'Uttar Pradesh',
                ].map(
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
              const SizedBox(height: 90),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => AdditionalDetailsPage()))),
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

  Widget buildTextField(String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
