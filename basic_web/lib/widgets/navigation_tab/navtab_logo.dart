import 'package:flutter/material.dart';

class NavTabLogo extends StatelessWidget {
  const NavTabLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 150,
            width: 200,
            child: Image.asset('assets/images/DecimalLogo.png',color: Colors.white),
          );
  }
}