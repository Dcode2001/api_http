import 'package:api_http/eight.dart';
import 'package:api_http/eleven.dart';
import 'package:api_http/fifteen.dart';
import 'package:api_http/five.dart';
import 'package:api_http/fourteen.dart';
import 'package:api_http/fouth.dart';
import 'package:api_http/nine.dart';
import 'package:api_http/nineteen.dart';
import 'package:api_http/second.dart';
import 'package:api_http/seven.dart';
import 'package:api_http/seventeen.dart';
import 'package:api_http/six.dart';
import 'package:api_http/sixteen.dart';
import 'package:api_http/ten.dart';
import 'package:api_http/third.dart';
import 'package:api_http/thirteen.dart';
import 'package:api_http/twelve.dart';
import 'package:api_http/twenty.dart';
import 'package:api_http/twentyfour.dart';
import 'package:api_http/twentyone.dart';
import 'package:api_http/twentythree.dart';
import 'package:api_http/twentytwo.dart';
import 'package:flutter/material.dart';

import 'eighteen.dart';
import 'first.dart';

void main() {
  runApp(MaterialApp(
    home: ALlApi(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class ALlApi extends StatefulWidget {
  const ALlApi({Key? key}) : super(key: key);

  @override
  State<ALlApi> createState() => _ALlApiState();
}

class _ALlApiState extends State<ALlApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select API ON HTTP"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                "Json Place Holder API Link HTTP Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,decoration: TextDecoration.underline),
              ),
            )),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return first();
                        },
                      ));
                    },
                    child: Text("1.posts/")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return second();
                        },
                      ));
                    },
                    child: Text("2.comments/")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return third();
                        },
                      ));
                    },
                    child: Text("3.albums/")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return fourth();
                        },
                      ));
                    },
                    child: Text("4.photos/")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return five();
                        },
                      ));
                    },
                    child: Text("5.todos/")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return six();
                        },
                      ));
                    },
                    child: Text("6.users/")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return seven();
                        },
                      ));
                    },
                    child: Text("7.posts/")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return eight();
                        },
                      ));
                    },
                    child: Text("8.posts/1/")),
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return nine();
                          },
                        ));
                      },
                      child: Text("9.posts/1/comments")),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ten();
                          },
                        ));
                      },
                      child: Text("10./comments?postId=1")),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(
              height: 4,
              thickness: 4,
              color: Colors.purple,
            ),
            SizedBox(height: 20),
            Center(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                "Dummy Json API Link HTTP Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,decoration: TextDecoration.underline),
              ),
            )),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return eleven();
                        },
                      ));
                    },
                    child: Text("11./products")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return twelve();
                        },
                      ));
                    },
                    child: Text("12./carts")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return thirteen();
                        },
                      ));
                    },
                    child: Text("13./users")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return fourteen();
                        },
                      ));
                    },
                    child: Text("14./posts")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return fifteen();
                        },
                      ));
                    },
                    child: Text("15./comments")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return sixteen();
                        },
                      ));
                    },
                    child: Text("16./quotes")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return seventeen();
                        },
                      ));
                    },
                    child: Text("17./todos")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return eighteen();
                        },
                      ));
                    },
                    child: Text("18./http")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return nineteen();
                        },
                      ));
                    },
                    child: Text("19./products")),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return twenty();
                        },
                      ));
                    },
                    child: Text("20./products/1")),
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return twentyone();
                          },
                        ));
                      },
                      child: Text("21./products/search?q=Laptop")),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return twentytwo();
                          },
                        ));
                      },
                      child: Text("22./products/categories")),
                ],
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return twentythree();
                          },
                        ));
                      },
                      child: Text("23./products/category/smartphones")),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return twentyfour();
                          },
                        ));
                      },
                      child: Text("24./auth/products")),
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      )),
    );
  }
}
