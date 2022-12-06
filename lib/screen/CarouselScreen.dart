import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/constant.dart';

class CarouselScreen extends StatefulWidget {
  State<CarouselScreen> createState() => CarouselScreenState();
}

class CarouselScreenState extends State<CarouselScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CarouselSlider(
              items: storyimages.map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    color: i == 0 ? Colors.red : Colors.black,
                    child: Center(child: Image.network(i)),
                  );
                });
              }).toList(),
              options: CarouselOptions(
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.vertical,
                  aspectRatio: 1,
                  viewportFraction: 1))
        ]),
      ),
    );
  }
}
