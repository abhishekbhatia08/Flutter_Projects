import 'package:flutter/material.dart';
import 'navtab_logo.dart';
import 'navtab_item.dart';
class NaviagationTabTableDesktop extends StatelessWidget {
  const NaviagationTabTableDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavTabLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavTabItem(
                'Vahana',
              ),
              SizedBox(
                width: 60,
              ),
              NavTabItem('Saarthi'),
            ],
          )
        ],
      ),
    );
  }
}