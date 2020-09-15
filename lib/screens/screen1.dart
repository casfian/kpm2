import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Screen1 extends StatefulWidget {
  // final List<Student> students = [
  //   Student('images/ali.png', 'Ali', '35761537'),
  //   Student('images/abu.png', 'Abu', '25351237'),
  //   Student('images/ahmad.png', 'Ahmad', '6726463')
  // ];

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List students; //arrray

  Future<List> getPosts() async {
    String url =
        'https://raw.githubusercontent.com/casfian/jsontest/master/test.json';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body); //private variable
      var resultJSON = jsonResponse;
      students = resultJSON; //tukar private ke global variable
      print('JSON dalam result: $resultJSON');
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
        title: Text('Senarai'),
      ),
      body: FutureBuilder(
          future: getPosts(), //ambik dari function getpost utk
          //bina satu senarai data
          builder: (context, AsyncSnapshot snapshot) {
            //check kalau ada data dulu
            if (!snapshot.hasData) {
              //kalau takde data maka...
              return Text('Takde data le bang');
            } else {
              //kalau ada data maka...
              return Container(
                color: Colors.amber,
                child: ListView.builder(
                    itemCount: students == null
                        ? 0
                        : students.length, //check kalau takde data
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.network('url'),
                                  Image.asset(
                                      students[index]['photo'].toString()),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(students[index]['nama'].toString()),
                                  Text(students[index]['email'].toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
