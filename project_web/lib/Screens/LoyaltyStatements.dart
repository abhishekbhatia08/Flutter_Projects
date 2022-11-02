import 'package:flutter/material.dart';

class LoyaltyStatements extends StatefulWidget {
  @override
  State<LoyaltyStatements> createState() => _LoyaltyStatementsState();
}

class _LoyaltyStatementsState extends State<LoyaltyStatements> {
  String? valueChoose;
  List listItem = ['All', 'Financial', 'Non Financial'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q='),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 60),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    iconSize: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Loyalty Statements',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.only(left: 18, right: 18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton(
                  hint: Text(
                    "Filter",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  dropdownColor: Colors.white,
                  underline: SizedBox(),
                  isExpanded: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String;
                    });
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
