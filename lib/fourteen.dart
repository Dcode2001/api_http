import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class fourteen extends StatefulWidget {
  const fourteen({Key? key}) : super(key: key);

  @override
  State<fourteen> createState() => _fourteenState();
}

class _fourteenState extends State<fourteen> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    l = jsonDecode(response.body)["posts"];

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fourteen API"),
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
                      Text("title : ${m.title}"),
                      Text("body : ${m.body}"),
                      Text("userId : ${m.userId}"),
                      Text("age : ${m.reactions}"),
                      SizedBox(height: 3),
                      Text(
                        "TAGS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 3),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: m.tags!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("TAGS :${m.tags![index]}"),
                          );
                        },
                      ),
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
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  Acess(
      {this.id, this.title, this.body, this.userId, this.tags, this.reactions});

  Acess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['tags'] = this.tags;
    data['reactions'] = this.reactions;
    return data;
  }
}
