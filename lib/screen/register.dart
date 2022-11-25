import 'package:flutter/material.dart';
import 'package:testing/main.dart';

class Signup extends StatefulWidget {
  @override
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
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.cyanAccent[400],
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFF656464),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFF656464),
                              width: 0.5,
                            ),
                          ),
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 15),
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
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Material(
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: const BoxDecoration(
                              color: Colors.blue //cyanAccent[400],
                              // borderRadius: BorderRadius.circular(20),
                              ),
                          alignment: const AlignmentDirectional(
                              -0.050000000000000044, 0),
                          child: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: Text(
                              'Sign-Up',
                              style: TextStyle(
                                color: Color(0xFFFDFAFA),
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
          ],
        ),
      ),
    );
  }
}
