import 'package:chat_app/screens/dashboard_screen.dart';
import 'package:chat_app/widgets/mobile_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobile = TextEditingController();
  FirebaseUser _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.1, horizontal: 25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/aap_logo.png",
                      height: 70,
                      width: 120,
                    )),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "AAP will need to verify your phone number",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Enter your Number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                MobileTextField(
                  contoller: mobile,
                )
              ]),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          signInWithGoogle(model).then((FirebaseUser user) {
            model.clearAllModels();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DashboardScreen();
            }));
          }).catchError((e) => print(e));
        },
        child: Container(
          height: screenSize.height * 0.08,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.blue,
          ),
          child: const Text(
            "SIGN IN WITH GOOGLE",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> signInWithGoogle(SignInViewModel model) async {
    model.state = ViewState.Busy;

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    AuthCredential authResult = (await _auth.signInWithCredential(credential)) as AuthCredential;
    _user = authResult.user;
    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);
    FirebaseUser currentUser = await _auth.currentUser();
    assert(_user.uid == currentUser.uid);
    model.state = ViewState.Idle;
    print("User Name: ${_user.displayName}");
    print("User Email ${_user.email}");
  }
}
