import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/main.dart';

import 'Imageupload.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  bool passworderror = false;
  bool emailerror = false;
  String passworderrortext = "";
  String emailerrortext = "";
  bool phonekeyboardvisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xFF656464),
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: emailcontroller,
                          obscureText: false,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                              color: Color(0xFF848383),
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: Icon(Icons.mail),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF848383),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (emailerror)
                      Text(
                        emailerrortext,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xFF656464),
                          width: 0.5,
                        ),
                      ),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 15),
                          hintText: 'Password',
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 26,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (passworderror)
                      Text(
                        passworderrortext,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Material(
                  child: GestureDetector(
                    onTap: () async {
                      await registeruser();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.black, //cyanAccent[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment:
                          const AlignmentDirectional(-0.050000000000000044, 0),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  registeruser() async {
    try {
      if (emailcontroller.text.isEmpty) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Enter correct email"),
              );
            });
      } else if (passwordcontroller.text.length < 6) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Password length should be minimum 6"),
              );
            });
      } else {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
        final currentUser = FirebaseAuth.instance.currentUser;
        assert(user.user!.uid == currentUser!.uid);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) {
          return const ImageUpload();
        }), (route) => false);
      }
      // ignore: empty_catches
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Password is weak"),
              );
            });
      } else {
        if (e.code == "email-already-in-use") {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("Email already in use"),
                );
              });
        } else {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(e.code.toString()),
                );
              });
        }
      }
    }
  }
}
