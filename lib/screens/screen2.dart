import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List students;

  Future<List> getPosts() async {
    var url =
        'https://raw.githubusercontent.com/casfian/jsontest/master/test.json';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var myjson = jsonResponse['result'];
      students = myjson;
      //print('JSON: $myjson');
      print('==========================\n\n');
      print('JSON: $myjson');
      return students;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Screen2'),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('Menu 1'),
                onTap: () {
                  print('Click Menu 1');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                  title: Text('Menu 2'),
                  onTap: () {
                    print('Click Menu 2');
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text('Menu 3'),
                  onTap: () {
                    print('Click Menu 3');
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
        body: FutureBuilder(
            future: getPosts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: students == null ? 0 : students.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Color.fromRGBO(216, 216, 216, 1),
                            elevation: 4,
                            shadowColor: Colors.grey,
                            child: ListTile(
                              leading: Image.asset(
                                  students[index]['photo'].toString()),
                              title: Text(students[index]['nama']),
                              subtitle: Text(students[index]['email']),
                              onTap: () {
                                Navigator.pushNamed(context, 'screen3');
                              },
                            ),
                          );
                        }));
              }
            }));
  }
}
