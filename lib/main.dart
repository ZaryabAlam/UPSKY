import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPSKY',
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 1200),
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.lightBlue
          // fontFamily: GoogleFonts.quicksand().fontFamily,
          ),
      home: Homepage(),
    );
  }
}
