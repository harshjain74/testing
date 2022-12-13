import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpScreen extends StatefulWidget {
  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  TextEditingController namecontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Api"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: TextFormField(
                controller: namecontroller,
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (namecontroller.text.isNotEmpty) {
                  await callapi(namecontroller.text);
                } else {
                  print("Enter name");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Text(
                    "Hit Api",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  callapi(String name) async {
    try {
      var url = await http.get(
        Uri.parse("https://api.genderize.io?name=$name"),
      );
      if (url.statusCode != 200) {
        return print("error");
      } else {
        print(url.body);
      }
    } on SocketException {
      print("no network found");
    } catch (e) {
      print(e);
    }
  }
}
