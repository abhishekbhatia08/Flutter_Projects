import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 50
                : 80;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 15
                : 21;

        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '#digitisingBFSI',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    height: 2.2,
                    color: Colors.red),
              ),
              Text(
                'India’s #1 Digital \nAcquisition Platform',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: titleSize,
                  height: 0.9,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Drive efficiency, productivity & build superior customer \nexperience using our AI-enabled No Code Platform',
                style: TextStyle(
                  fontSize: descriptionSize,
                  height: 1.7,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
