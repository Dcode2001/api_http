import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class eighteen extends StatefulWidget {
  const eighteen({Key? key}) : super(key: key);

  @override
  State<eighteen> createState() => _eighteenState();
}

class _eighteenState extends State<eighteen> {
  List l = [];
  Map? k;
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/http/200/Hello%20Peter');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    k = jsonDecode(response.body);
    l.add(k);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eighteen API"),
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
                Text("status : ${m.status}"),
                Text("message : ${m.message}"),

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
  String? status;
  String? message;

  Acess({this.status, this.message});

  Acess.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
