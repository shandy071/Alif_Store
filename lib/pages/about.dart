import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Shandy Alif Ramadhan 18111228",
        style: TextStyle(fontSize: 30, color: Colors.blue),
      ),
    ));
  }
}
