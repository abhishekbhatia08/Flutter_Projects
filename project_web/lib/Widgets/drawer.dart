import 'package:flutter/material.dart';
import 'package:project_web/CustomerProfile/AdditionalDetails.dart';
import 'package:project_web/CustomerProfile/Address.dart';
import 'package:project_web/CustomerProfile/PersonalDetails.dart';
import 'package:project_web/Screens/India1.dart';
import 'package:project_web/Screens/LoyaltyStatements.dart';
import 'package:project_web/Screens/Preferred_Language.dart';
import 'package:project_web/Screens/cashback.dart';
import 'package:project_web/Screens/redemption.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 120,
            child: DrawerHeader(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(color: Colors.lightBlue[800]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Abhishek",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "+91 9654422129",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 25)),
                  Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.lightBlue[800],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          ExpansionTile(
            title: GestureDetector(
              child: Text(
                "Customer Profile",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            leading: Icon(Icons.person, color: Colors.blue, size: 35),
            childrenPadding: EdgeInsets.all(15),
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ProfilePage()))),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 55),
                  child:
                      Text("Personal Details", style: TextStyle(fontSize: 16)),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AddressPage()))),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 55),
                  child: Text(
                    "Address",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => AdditionalDetailsPage()))),
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 55),
                    child: Text("Additional Details",
                        style: TextStyle(fontSize: 16))),
              )
            ],
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CashbackMode())));
            },
            leading: Icon(
              Icons.euro,
              color: Colors.blue,
              size: 35,
            ),
            title: const Text(
              "Cashback Mode",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(Icons.check_outlined, color: Colors.blue, size: 35),
            title: const Text(
              "Transaction Details",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Redemption())));
            },
            leading: Icon(Icons.notes, color: Colors.blue, size: 35),
            title: const Text(
              "Redemption Details",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => LoyaltyStatements())));
            },
            leading: Icon(Icons.loyalty, color: Colors.blue, size: 35),
            title: const Text(
              "Loyalty Statements ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => PreferredLanguage()))),
            leading: Icon(Icons.logout, color: Colors.blue, size: 38),
            title: const Text(
              "Logout",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
