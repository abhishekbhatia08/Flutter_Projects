import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import './home_content_desktop.dart';
import './home_content_mobile.dart';
import '../widgets/call_to_action/call_to_action.dart';
import '../widgets/centered_view.dart';
import '../widgets/navigation_tab/navigation_tab.dart';
import '../widgets/navigation_drawer/navigation_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? NavigationDrawer()
              : null,
          body:
              // CenteredView(
              //   child: Column(
              //     children: <Widget>[
              //       NavigationTab(),
              //       Expanded(
              //           child: ScreenTypeLayout(
              //         mobile: HomeContentMobile(),
              //         desktop: HomeContentDesktop(),
              //       ))
              //     ],
              //   ),
              // ),

              CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                flexibleSpace: NavigationTab(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return HomeContentDesktop();
                    // Expanded(
                    //   child: CenteredView(
                    //       child: Expanded(
                    //           child: ScreenTypeLayout(
                    //     mobile: HomeContentMobile(),
                    //     desktop: HomeContentDesktop(),
                    //   ))),
                    // );
                  },
                  childCount: 1,
                ),
              ),
            ],
          )),
    );
  }
}
