import 'package:flutter/material.dart';
import '../widgets/call_to_action/call_to_action.dart';
import '../widgets/introduction.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
        
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black,
              Colors.red,
            ],
          )),
          child: Row(
            children: <Widget>[
              Introduction(),
              Expanded(
                child: Center(
                  child: CallToAction('Request Demo'),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Text(
              "India’s Fastest Growing Financial Service Organisations Digitise With Us",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
