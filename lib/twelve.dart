import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';


class twelve extends StatefulWidget {
  const twelve({Key? key}) : super(key: key);

  @override
  State<twelve> createState() => _twelveState();
}

class _twelveState extends State<twelve> {
  Map<String, dynamic> m = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.parse('https://dummyjson.com/carts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    m = jsonDecode(response.body);
    d = dummy.fromJson(m);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dummy Carts"),
          ),
          body: status
              ?
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: d!.carts!.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                            leading: Text("${d!.carts![index].id}"),
                            title: Column(
                              children: [
                                ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount:
                                  d!.carts![index].products!.length,
                                  itemBuilder: (context, index1) {
                                    return ListTile(
                                      leading: Text(
                                          "${d!.carts![index].products![index1].id}"),
                                      title: Text(
                                          "${d!.carts![index].products![index1].title}"),
                                      subtitle: Column(
                                        children: [
                                          Text(
                                              "price :${d!.carts![index].products![index1].price}"),
                                          Text(
                                              "quantity :${d!.carts![index].products![index1].quantity}"),
                                          Text(
                                              "total :${d!.carts![index].products![index1].total}"),
                                          Text(
                                              "discountPercentage :${d!.carts![index].products![index1].discountPercentage}"),
                                          Text(
                                              "discountedPrice :${d!.carts![index].products![index1].discountedPrice}"),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ));
                    },
                  
                  /*Text("total :${d!.total}"),
                  Text("skip :${d!.skip}"),
                  Text("limit :${d!.limit}"),*/

          )
              : Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return ALlApi();
      },
    ));
    return Future.value();
  }
}

class dummy {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  dummy({this.carts, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Carts {
  int? id;
  List<Products>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts(
      {this.id,
        this.products,
        this.total,
        this.discountedTotal,
        this.userId,
        this.totalProducts,
        this.totalQuantity});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['discountedTotal'] = this.discountedTotal;
    data['userId'] = this.userId;
    data['totalProducts'] = this.totalProducts;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Products(
      {this.id,
        this.title,
        this.price,
        this.quantity,
        this.total,
        this.discountPercentage,
        this.discountedPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = double.parse(json['discountPercentage'].toString());;
    discountedPrice = json['discountedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedPrice'] = this.discountedPrice;
    return data;
  }
}

/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class twelve extends StatefulWidget {
  const twelve({Key? key}) : super(key: key);

  @override
  State<twelve> createState() => _twelveState();
}

class _twelveState extends State<twelve> {
  // List l = [];
  Map<String, dynamic> m = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/carts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    l = jsonDecode(response.body)['carts'];

    setState(() {
      status = true;
    });
    print("+++++++++++++++++++++++++++++++++++++++++$l");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("twelve API"),
        centerTitle: true,
      ),
      body: status
          ? ListView.builder(
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
                Text("price : ${m.price}"),
                Text("rating : ${m.quantity}"),
                Text("rating : ${m.total}"),
                Text("discountPercentage : ${m.discountPercentage}"),
                Text("stock : ${m.discountedPrice}"),
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
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Acess(
      {this.id,
        this.title,
        this.price,
        this.quantity,
        this.total,
        this.discountPercentage,
        this.discountedPrice});

  Acess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedPrice = json['discountedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedPrice'] = this.discountedPrice;
    return data;
  }
}

*/
