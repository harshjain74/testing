import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ListView"),
      ),
      body: Container(
        child: listviewbuildertile(),
      ),
    );
  }

  listviewtile() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        contacttile("Harshit", "1234567890"),
        contacttile("Ankur", "4512398"),
        contacttile("Ankit", "4512968763"),
        contacttile("Mohit", "1234567890"),
        contacttile("Rohan", "4512596874"),
        contacttile("Harshit", "1234567890"),
        contacttile("Ankur", "4512398"),
        contacttile("Ankit", "4512968763"),
        contacttile("Mohit", "1234567890"),
        contacttile("Rohan", "4512596874"),
        contacttile("Harshit", "1234567890"),
        contacttile("Ankur", "4512398"),
        contacttile("Ankit", "4512968763"),
        contacttile("Mohit", "1234567890"),
        contacttile("Rohan", "4512596874"),
      ],
    );
  }

  listviewbuildertile() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return contacttile("Test $index", "$index");
        });
  }

  listviewseparatedtile() {
    return ListView.separated(
      separatorBuilder: ((context, index) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            color: Colors.black);
      }),
      itemCount: 15,
      itemBuilder: (context, index) {
        return contacttile("Test $index", "$index");
      },
    );
  }

  contacttile(String name, String number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.lightBlue),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 5,
                    ),
                    Text(
                      number,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
