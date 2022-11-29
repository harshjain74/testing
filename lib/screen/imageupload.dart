import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/screen/login.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);
  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  logout() async {
    await FirebaseAuth.instance.signOut();
    // prefs.setBool("isuserlogin", false);
    prefs.remove("isuserlogin");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) {
      return const Login();
    }), (route) => false);
  }

  var _firebase;

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
    _firebase = FirebaseFirestore.instance.collection("ImageStore");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
        centerTitle: true,
        title: const Text("Image"),
      ),
      body: Container(
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("ImageStore").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Image.memory(
                            base64Decode(
                                snapshot.data.docs[index].data()['image']),
                            height: 200,
                            width: 100,
                          ),
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addImage();
        },
        tooltip: 'Add Image',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  addImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        convertimagetobyte(image.path).then((value) {
          FirebaseFirestore.instance
              .collection("ImageStore")
              .add({"image": value});
        });
      } else {
        print("error message");
      }
    });
  }

  convertimagetobyte(String imagepath) async {
    var byte = await File(imagepath).readAsBytes();
    return await base64Encode(byte);
  }
}
