import 'package:flutter/material.dart';
import './navtab_logo.dart';
class NavigationTabMobile extends StatelessWidget {
  const NavigationTabMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          NavTabLogo()
        ],
      ),
    );
  }
}