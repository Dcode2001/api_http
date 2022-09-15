import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class twentyfour extends StatefulWidget {
  const twentyfour({Key? key}) : super(key: key);

  @override
  State<twentyfour> createState() => _twentyfourState();
}

class _twentyfourState extends State<twentyfour> {
  List l = [];
  Map? k;
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/auth/products');
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
        title: Text("twentyfour API"),
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
                      Text("Message : ${m.message}"),
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

class Acess {
  String? message;

  Acess({this.message});

  Acess.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
