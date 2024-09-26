import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './CustomerProfile/AdditionalDetails.dart';
import './CustomerProfile/Address.dart';
import './CustomerProfile/PersonalDetails.dart';
import './Screens/LoanPage.dart';
import './Screens/LoyaltyStatements.dart';
import './Screens/cashback.dart';
import './Screens/redemption.dart';
import './Screens/OTP.dart';
import './Screens/India1.dart';
import './Screens/Number_Verification.dart';
import './Screens/Preferred_Language.dart';
import 'Screens/Passcode.dart';
import './Screens/profile.dart';
import './Screens/dashboard.dart';

void main() => runApp(MyApp());
SharedPreferences? localStorage;

TextEditingController numberController = new TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'India 1 Website',
      debugShowCheckedModeBanner: false,
      routes: {
        'numberverifcation': (context) => NumberVerification(),
        'preferredlanguage': (context) => PreferredLanguage(),
        'OTP': (context) => OTPScreen(),
        'passcode': (context) => Passcode(),
        'profile': (context) => Profile(),
        'dashboard': (context) => Dashboard(),
        'redemption': (context) => Redemption(),
        'cashback': (context) => CashbackMode(),
        'personaldetails': (context) => ProfilePage(),
        'address': (context) => AddressPage(),
        'additionaldetails': (context) => AdditionalDetailsPage(),
        'loanpage': (context) => LoanPage(),
        'loyaltystaments': (context) => LoyaltyStatements(),
      },
      home: Dashboard(),
    );
  }
}
