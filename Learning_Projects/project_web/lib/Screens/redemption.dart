import 'package:flutter/material.dart';

class Redemption extends StatefulWidget {
  @override
  State<Redemption> createState() => _RedemptionState();
}

class _RedemptionState extends State<Redemption> {
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final MediaWidth = MediaQuery.of(context).size.width;
    final MediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://media.istockphoto.com/vectors/abstract-hexagon-wallpaper-white-background-3d-vector-illustration-vector-id1212342896?k=20&m=1212342896&s=612x612&w=0&h=fp3B4g_hE54snO4Nf1ggElVnI0gD9s7tPd5JU0eFl9Q='),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaHeight * 0.05, horizontal: MediaWidth * 0.05),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: MediaWidth * 0.025),
                  Text(
                    'Redemption',
                    style: TextStyle(
                      fontSize: 45 * curScaleFactor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Eligible cashback amount for redemption.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20 * curScaleFactor,
              ),
            ),
            Text(
              '10',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                height: MediaHeight * 0.003,
                fontSize: 40 * curScaleFactor,
                color: Color.fromARGB(255, 10, 102, 177),
              ),
            ),
            SizedBox(height: MediaHeight * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Redeemable Points:',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17 * curScaleFactor,
                    color: Color.fromARGB(255, 10, 102, 177),
                  ),
                ),
                // SizedBox(width: MediaWidth * 0.27),
                Text(
                  '10',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20 * curScaleFactor,
                    color: Color.fromARGB(255, 10, 102, 177),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'All Time Reward Point Earned:',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17 * curScaleFactor,
                    color: Color.fromARGB(255, 10, 102, 177),
                  ),
                ),
                // SizedBox(width: MediaWidth * 0.23),
                Text(
                  '10',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20 * curScaleFactor,
                    color: Color.fromARGB(255, 10, 102, 177),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaHeight * 0.1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Redeem your Points",
                  style: TextStyle(
                    fontSize: 30 * curScaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 10, 102, 177),
                      ),
                      width: MediaWidth * 0.3,
                      height: MediaHeight * 0.15,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaHeight * 0.02,
                          horizontal: MediaHeight * 0.02,
                        ),
                        child: Text(
                          'Cashback',
                          style: TextStyle(
                              fontSize: 30 * curScaleFactor,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaWidth * 0.04),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 10, 102, 177),
                      ),
                      width: MediaWidth * 0.3,
                      height: MediaHeight * 0.15,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaHeight * 0.02,
                          horizontal: MediaHeight * 0.02,
                        ),
                        child: Text(
                          'Mobile \nRecharge',
                          style: TextStyle(
                              fontSize: 30 * curScaleFactor,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
