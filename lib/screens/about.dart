
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeekforGeeks"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
              child: Text("Go to first screen"),
              onPressed: null
          ),
        ),
      ),

    );
  }
}