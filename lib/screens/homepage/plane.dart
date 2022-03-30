import 'package:flutter/material.dart';
import 'package:soultion/Data/data.dart';

class planes extends StatefulWidget {
  const planes({Key? key}) : super(key: key);

  @override
  _planesState createState() => _planesState();
}

class _planesState extends State<planes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset("assets/images/${img[indeximg]}"),
      ),
    );
  }
}
