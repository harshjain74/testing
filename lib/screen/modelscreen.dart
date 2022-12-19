import 'package:flutter/material.dart';
import 'package:testing/models/model.dart';

class ModelScreen extends StatefulWidget {
  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  late Model model;

  void initState() {
    super.initState();
    model = Model.fromjson({
      "name": "Aniket",
      "date": "17-12-2022",
      "isabsent": true,
      "rollno": 45,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Models"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            datatile("Name", model.name),
            datatile("Roll No.", model.rollno.toString()),
            datatile("Absent", model.isabsent ? "Yes" : "No"),
            datatile("Date", model.date),
          ],
        ),
      ),
    );
  }

  datatile(String titleoftile, String dataoftile) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$titleoftile :",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            dataoftile,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
