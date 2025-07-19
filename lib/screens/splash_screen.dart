import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_globe/common/text.dart';
import 'package:movie_globe/main.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (Context) => Home(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: modifiedText(text: 'MOVIE GLOBE', color: Colors.red, size: 40)),
    );
  }
}
