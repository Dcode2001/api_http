import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sixteen extends StatefulWidget {
  const sixteen({Key? key}) : super(key: key);

  @override
  State<sixteen> createState() => _sixteenState();
}

class _sixteenState extends State<sixteen> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/quotes');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    l = jsonDecode(response.body)["quotes"];

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sixteen API"),
        centerTitle: true,
      ),
      body: status
          ? ListView.builder(
        shrinkWrap: true,
        primary: true,
        itemCount: l.length,
        itemBuilder: (context, index) {
          Acess m = Acess.fromJson(l[index]);

          return Card(
            color: Colors.purple.shade100,
            margin: EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Id : ${m.id}"),
                Text("quote : ${m.quote}"),
                Text("author : ${m.author}"),
              ],
            ),
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
  int? id;
  String? quote;
  String? author;

  Acess({this.id, this.quote, this.author});

  Acess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}
