import 'package:flutter/material.dart';
import 'package:project_web/Screens/dashboard.dart';

class CashbackMode extends StatefulWidget {
  @override
  State<CashbackMode> createState() => _CashbackModeState();
}

class _CashbackModeState extends State<CashbackMode>
    with SingleTickerProviderStateMixin {
  int _value = 1;
  var _result;
  late TabController _tabController;
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  SizedBox(
                    width: MediaWidth * 0.0025,
                  ),
                  Text(
                    'Cashback Mode',
                    style: TextStyle(
                      fontSize: curScaleFactor * 45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose Your Default Cashback Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: curScaleFactor * 18,
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: const Text('Bank'),
                    groupValue: null,
                    value: null,
                    selected: false,
                    onChanged: (Null? value) {
                      setState(() {});
                    },
                  ),
                  RadioListTile(
                    selected: false,
                    toggleable: true,
                    title: const Text('UPI'),
                    groupValue: null,
                    onChanged: (Null? value) {
                      setState(() {});
                    },
                    value: null,
                  ),
                  SizedBox(height: MediaHeight * 0.002),
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance,
                        size: 32,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: MediaWidth * 0.002,
                      ),
                      Text(
                        'Bank Details',
                        style: TextStyle(
                          fontSize:curScaleFactor* 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 15,
                      bottom: 15,
                    ),
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 220, 220, 220),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account number:',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'IFSC Code:',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Customer Name:',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  TabBar(controller: _tabController, tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Bank Details',
                        style: TextStyle(color: Colors.black),
                      ),
                      // text: 'Bank Details',
                    ),
                    Tab(
                      child: Text(
                        'UPI Details',
                        style: TextStyle(color: Colors.black),
                      ),
                      // text: 'UPI Details',
                    )
                  ]),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        .25, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: TabBarView(controller: _tabController, children: [
                      Column(
                        children: [
                          // Text("$_tabController"),
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                              'Account number',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                              'IFSC Code',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                              'Customer Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                              'UPI id',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                              'Customer Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Dashboard())));
                  },
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontSize: 17, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 25)
            ],
          ),
        ),
      ),
    ));
  }
}
