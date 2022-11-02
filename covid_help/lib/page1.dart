import 'package:flutter/material.dart';
import 'page2.dart';
import 'dummypage.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Covid Help India',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Container(
                    width: 125,
                    height: 70,
                    child: Image.asset('assets/images/india_flag.png'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Connecting volunteers with Careseekers',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaWidth * 0.5,
                    color: Colors.pink[100],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: SizedBox(
                            height: 350,
                            width: 500,
                            child: Card(
                              color: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.all(20.0),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const ListTile(
                                      title: const Text(
                                        'Care Seekers',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: const Text(
                                        'Get help from verified volunteer',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "How to reciecve help",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 25,
                                          backgroundColor: Colors.pink[900],
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 70),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.clean_hands_outlined,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.contact_mail,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.format_list_bulleted,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Mention Need",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Add Yours Detials",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Get volunteer",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 50,
                            width: 250,
                            child: FlatButton(
                              color: Colors.blue[100],
                              child: const Text(
                                'Get Help Now',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => DummyPage())));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaWidth * 0.5,
                    color: Colors.green[100],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: SizedBox(
                            height: 350,
                            width: 500,
                            child: Card(
                              color: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.all(20),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const ListTile(
                                      title: const Text(
                                        'For Volunteers',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        'Register for helping covid Patients',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "How to Volunteer",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 25,
                                          backgroundColor: Colors.green[900],
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 70),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.category,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.clean_hands_sharp,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.phone_callback,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Mention Need",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Add Yours Detials",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Get volunteer",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 50,
                            width: 250,
                            child: FlatButton(
                              color: Colors.blue[100],
                              child: const Text(
                                'Give Help Now',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => DummyPage())));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  Spacer(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Registered?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
