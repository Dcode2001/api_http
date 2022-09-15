import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class twentytwo extends StatefulWidget {
  const twentytwo({Key? key}) : super(key: key);

  @override
  State<twentytwo> createState() => _twentytwoState();
}

class _twentytwoState extends State<twentytwo> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/products/categories');
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
        title: Text("twentytwo API"),
        centerTitle: true,
      ),
      body: status
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {

          // Map m = l[index];
          return Card(
            color: Colors.purple.shade100,
            margin: EdgeInsets.all(4),
            child:
                Text("${l[index]}"),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

