import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  double groupAligment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        leading: const BackButton(
          color: ColorConstants.headingColor,
        ),
        title: const Text(
          "Fruits and Vegetables()",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 30,
            color: ColorConstants.headingColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                weight: 10,
                size: 30,
                color: ColorConstants.headingColor,
              ))
        ],
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            TabBar(
              tabs: [
                Text("tab1"),
                Text("tab2"),
              ],
              isScrollable: true,
            ),
            VerticalDivider(thickness: 1, width: 1),
            TabBarView(children: [
              Text("tab1"),
              Text("tab1"),
            ])
            // NavigationRail(
            //   selectedIndex: _selectedIndex,
            //   groupAlignment: groupAligment,
            //   onDestinationSelected: (int index) {
            //     setState(() {
            //       _selectedIndex = index;
            //     });
            //   },
            //   labelType: labelType,
            //   destinations: const <NavigationRailDestination>[
            //     NavigationRailDestination(
            //       icon: Icon(Icons.favorite_border),
            //       selectedIcon: Icon(Icons.favorite),
            //       label: Text('First'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.bookmark_border),
            //       selectedIcon: Icon(Icons.book),
            //       label: Text('Second'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.star_border),
            //       selectedIcon: Icon(Icons.star),
            //       label: Text('Third'),
            //     ),
            //   ],
            // ),
            // This is the main content.
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
