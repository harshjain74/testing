import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../provider/prov.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SecondScreen();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                    child: Text(
                      "Go to Stateful",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ThirdScreen();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                    child: Text(
                      "Go to Stateless",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            Text(
              context.watch<Prov>().gmail,
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    //read is used to set the value
                    context.read<Prov>().setgmail("statefulwidget@gmail.com");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                      child: Text(
                        "Change gmail to Stateful@gmail.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              Text(
                context
                    .watch<Prov>()
                    .gmail, //watch is used to show the value after update value
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          )),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  // read is used to set the values
                  context.read<Prov>().setgmail("statelesswidget@gmail.com");
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                    child: Text(
                      "Change gmail to Stateless@gmail.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            Text(
              context.watch<Prov>().gmail,
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
