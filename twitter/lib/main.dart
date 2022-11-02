import 'package:flutter/material.dart';
import 'package:twitter/followers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter'),
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pic2.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 15,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          HeroWidgetDetail(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                    )),
                    child: Hero(
                      tag: 'DisplayPic',
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/pic1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 65),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Abhishek Bhatia ',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Icon(Icons.verified),
                    Spacer(),
                    Card(
                      child: Text('FOLLOWS YOU', textAlign: TextAlign.end),
                      color: Colors.grey,
                    )
                  ],
                ),
                Text('@abhishekbhatia',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey, fontSize: 15)),
                Text(
                  '''M 21 Gurugram 
Learning Flutter''',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_pin, color: Colors.grey),
                    Text('Gurugram , HR', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('123 ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text('FOLLOWING  ',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Followers())));
                      },
                      child: Text('237 ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Followers())));
                      },
                      child: Text('FOLLOWERS',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeroWidgetDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Abhishek Bhatia'),
        ),
        body: Container(
          color: Colors.black87,
          child: Center(
            child: Hero(
                tag: 'DisplayPic',
                child: Image.asset('assets/images/pic1.jpg')),
          ),
        ));
  }
}
