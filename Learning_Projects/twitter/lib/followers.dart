import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Followers extends StatelessWidget {
  Future<List<dynamic>> fetchUsers() async {
    var result =
        await http.get(Uri.parse("https://randomuser.me/api/?results=237"));
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['first'] + " " + user['name']['last'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(_name(snapshot.data[0]));
              return ListView.builder(
                
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    snapshot.data[index]['picture']['large'])),
                            title: Text(_name(snapshot.data[index])),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
