import 'package:flutter/material.dart';
import '../Screens/Preferred_Language.dart';
import '../Screens/Number_Verification.dart';

class PreferredLanguageCard extends StatelessWidget {
  const PreferredLanguageCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => NumberVerification())));
      },
      child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          color: Color.fromARGB(255, 29, 88, 137),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    choice.title,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    choice.language,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ]),
          )),
    );
  }
}
