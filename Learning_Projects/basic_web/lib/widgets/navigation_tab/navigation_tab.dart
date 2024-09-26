import'navtab_logo.dart';
import 'package:flutter/material.dart';
import 'navtab_item.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navtab_mobile.dart';
import 'navtab_tablet_desktop.dart';

class NavigationTab extends StatelessWidget {
  const NavigationTab({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationTabMobile(),
      tablet: NaviagationTabTableDesktop(),
    );
  }
}
