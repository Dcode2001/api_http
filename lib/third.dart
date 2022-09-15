import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    l = jsonDecode(response.body);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("third API"),
        centerTitle: true,
      ),
      body: status
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {

          Acess m = Acess.fromJson(l[index]);

          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.purple,child: Text("${m.id}",style: TextStyle(color: Colors.white),),),
            title: Text("Title:${m.title}\n"),
            subtitle: Text("UserId:${m.userId}\n"),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// Json To Dart Class

class Acess {
  int? userId;
  int? id;
  String? title;

  Acess({this.userId, this.id, this.title});

  Acess.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
