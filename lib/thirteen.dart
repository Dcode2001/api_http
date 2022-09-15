import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class thirteen extends StatefulWidget {
  const thirteen({Key? key}) : super(key: key);

  @override
  State<thirteen> createState() => _thirteenState();
}

class _thirteenState extends State<thirteen> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData() async {
    var url = Uri.parse('https://dummyjson.com/users');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    l = jsonDecode(response.body)["users"];

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("thirteen API"),
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
                Text("firstName : ${m.firstName}"),
                Text("lastName : ${m.lastName}"),
                Text("maidenName : ${m.maidenName}"),
                Text("age : ${m.age}"),
                Text("gender : ${m.gender}"),
                Text("email : ${m.email}"),
                Text("phone : ${m.phone}"),
                Text("birthDate : ${m.birthDate}"),
                Text("image : ${m.image}"),
                Text("bloodGroup : ${m.bloodGroup}"),
                Text("height : ${m.height}"),
                Text("weight : ${m.weight}"),
                Text("eyeColor : ${m.eyeColor}"),
                Text("color : ${m.hair!.color}"),
                Text("type : ${m.hair!.type}"),
                Text("domain : ${m.domain}"),
                Text("ip : ${m.ip}"),
                SizedBox(height: 10),
                Text("ADDRESS",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5),
                Text("address : ${m.address!.address}"),
                Text("city : ${m.address!.city}"),
                Text("lat : ${m.address!.coordinates!.lat}"),
                Text("lng : ${m.address!.coordinates!.lng}"),
                Text("postalCode : ${m.address!.postalCode}"),
                Text("state : ${m.address!.state}"),
                Text("macAddress : ${m.macAddress}"),
                Text("university : ${m.university}"),
                Text("state : ${m.address!.state}"),
                SizedBox(height: 10),
                Text("BANK",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5),
                Text("cardExpire : ${m.bank!.cardExpire}"),
                Text("cardNumber : ${m.bank!.cardNumber}"),
                Text("cardType : ${m.bank!.cardType}"),
                Text("currency : ${m.bank!.currency}"),
                Text("iban : ${m.bank!.iban}"),
                SizedBox(height: 10),
                Text("COMPANY ADDRESS",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5),
                Text("address : ${m.company!.address!.address}"),
                Text("city : ${m.company!.address!.city}"),
                Text("lng : ${m.company!.address!.coordinates!.lng}"),
                Text("lat : ${m.company!.address!.coordinates!.lat}"),
                Text("city : ${m.address!.postalCode}"),
                Text("city : ${m.address!.state}"),
                Text("department : ${m.company!.department}"),
                Text("name : ${m.company!.name}"),
                Text("title : ${m.company!.title}"),
                Text("ein : ${m.ein}"),
                Text("ssn : ${m.ssn}"),
                Text("userAgent : ${m.userAgent}"),

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
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  Acess(
      {this.id,
        this.firstName,
        this.lastName,
        this.maidenName,
        this.age,
        this.gender,
        this.email,
        this.phone,
        this.username,
        this.password,
        this.birthDate,
        this.image,
        this.bloodGroup,
        this.height,
        this.weight,
        this.eyeColor,
        this.hair,
        this.domain,
        this.ip,
        this.address,
        this.macAddress,
        this.university,
        this.bank,
        this.company,
        this.ein,
        this.ssn,
        this.userAgent});

  Acess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ? new Hair.fromJson(json['hair']) : null;
    domain = json['domain'];
    ip = json['ip'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['maidenName'] = this.maidenName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['password'] = this.password;
    data['birthDate'] = this.birthDate;
    data['image'] = this.image;
    data['bloodGroup'] = this.bloodGroup;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['eyeColor'] = this.eyeColor;
    if (this.hair != null) {
      data['hair'] = this.hair!.toJson();
    }
    data['domain'] = this.domain;
    data['ip'] = this.ip;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['macAddress'] = this.macAddress;
    data['university'] = this.university;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['ein'] = this.ein;
    data['ssn'] = this.ssn;
    data['userAgent'] = this.userAgent;
    return data;
  }
}

class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  Hair.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['type'] = this.type;
    return data;
  }
}

class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    postalCode = json['postalCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['postalCode'] = this.postalCode;
    data['state'] = this.state;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank(
      {this.cardExpire,
        this.cardNumber,
        this.cardType,
        this.currency,
        this.iban});

  Bank.fromJson(Map<String, dynamic> json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardExpire'] = this.cardExpire;
    data['cardNumber'] = this.cardNumber;
    data['cardType'] = this.cardType;
    data['currency'] = this.currency;
    data['iban'] = this.iban;
    return data;
  }
}

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({this.address, this.department, this.name, this.title});

  Company.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    department = json['department'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['department'] = this.department;
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}
