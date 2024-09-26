import 'package:flutter/material.dart';

class LoanPage extends StatefulWidget {
  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  bool? isChecked = false as bool;
  String _dropDownValue = 'Please Select';
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q='),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaWidth * 0.05, vertical: MediaHeight * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaHeight * 0.03),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: MediaWidth * 0.015),
                    Text(
                      'Apply for loan',
                      style: TextStyle(
                        fontSize: 45 * curScaleFactor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaHeight * 0.04),
                Text(
                  'Fill in the following options to establish how much you want to borrow and for how long.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18 * curScaleFactor,
                  ),
                ),
                SizedBox(height: MediaHeight * 0.04),
                Text(
                  'Loan Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25 * curScaleFactor,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(label: Text('Personal')),
                ),
                SizedBox(height: MediaHeight * 0.02),
                Text(
                  'Loan Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25 * curScaleFactor,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      label: Text('Please enter amount between 500 to 2,00,000')),
                ),
                SizedBox(height: MediaHeight * 0.02),
                Text(
                  'Loan Tenure',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25 * curScaleFactor,
                  ),
                ),
                DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('Dropdown')
                      : Text(
                          _dropDownValue,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                  isExpanded: true,
                  iconSize: 50.0 * curScaleFactor,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  items: ['2 Years', '5 Years', '10 Years'].map(
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
                SizedBox(
                  height: MediaHeight * 0.1,
                ),
                Container(
                  width: MediaWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
                          }),
                      SizedBox(
                        width: MediaWidth * 0.02,
                      ),
                      Container(
                        width: MediaWidth*0.7,
                        child: Text(
                          'I hereby agree to override the NDNC registry and allow the selected lenders to contact me via SMS, Whatsapp or calls.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * curScaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaHeight * 0.015),
                Divider(
                  thickness: 2,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('dashboard');
                    },
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaWidth * 0.025,
                        vertical: MediaHeight * 0.02),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "CHECK ELIGIBILITY",
                      style: TextStyle(
                          fontSize: 17 * curScaleFactor,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
