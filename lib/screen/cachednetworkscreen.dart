import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CachedNetworkScreen extends StatefulWidget {
  @override
  State<CachedNetworkScreen> createState() => _CachedNetworkScreenState();
}

class _CachedNetworkScreenState extends State<CachedNetworkScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Catched network Image",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CachedNetworkImage(
          imageUrl:
              "https://images.pexels.com/photos/7670035/pexels-photo-7670035.jpeg?auto=compress&cs=tinysrgb&w=600",
          placeholder: (context, placeholder) {
            return Center(child: CircularProgressIndicator());
          },
          imageBuilder: (context, imageprovider) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
                image: DecorationImage(image: imageprovider, fit: BoxFit.cover),
              ),
            );
          },
          errorWidget: (context, error, errormsg) {
            return Center(
                child: Icon(
              Icons.error,
              size: 34,
            ));
          },
        ),
      ),
    );
  }
}
