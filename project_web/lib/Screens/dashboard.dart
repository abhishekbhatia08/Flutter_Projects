import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_web/Screens/LoanPage.dart';
import 'package:project_web/Screens/LoyaltyStatements.dart';
import 'package:project_web/Screens/cashback.dart';
import 'package:project_web/Screens/redemption.dart';
import '../Widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: DashboardDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(
                "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1502864731/yhgb7yzuynlgvrdldevc.png",
                fit: BoxFit.contain,
                height: MediaHeight * 0.1,
                width: MediaWidth * 0.1,
              ),
            ],
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: NetworkImage(
            //       "https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q="),
            //   fit: BoxFit.cover,
            // ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 96, 119, 132),
                  Color.fromARGB(255, 205, 196, 196)
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/slider2.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/slider3.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/slider4.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    viewportFraction: 0.8,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Loyalty Summary",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                       onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoyaltyStatements()))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 183, 14, 2),
                        ),
                        width: 600,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Loyality \nPoints \n                                                                   40',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => CashbackMode()))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        width: 600,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Cashback \nEarned \n                                                                  ₹10',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen,
                      ),
                      width: 600,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Points  \nRedeemed \n                                                                    0',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(223, 162, 80, 22),
                      ),
                      width: 600,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Current Points \nAvailable \n                                                                   20',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Quick Links",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoanPage()))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 10, 102, 177),
                        ),
                        width: 600,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Apply for \nLoan',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Redemption()))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 10, 102, 177),
                        ),
                        width: 600,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Redemption',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
