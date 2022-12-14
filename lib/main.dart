import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/provider/prov.dart';
import 'package:testing/screen/HttpScreen.dart';
import 'package:testing/screen/ProviderClassScreens.dart';
import 'package:testing/screen/cachednetworkscreen.dart';
import 'package:testing/screen/listviewscreen.dart';
import 'package:testing/screen/modelscreen.dart';
import 'package:testing/screen/visibilityscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Prov())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Testing',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: ListViewScreen(),
      ),
    );
  }
}
