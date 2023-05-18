import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_app/data/bloc/user_cubit.dart';
import 'package:sign_up_app/utils/color_constants.dart';
import 'package:sign_up_app/screens/welcome_screen.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: MaterialApp(
        title: 'Sign Up Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: ColorConstants.primary),
        home: const WelcomeScreen(),
      ),
    );
  }
}
