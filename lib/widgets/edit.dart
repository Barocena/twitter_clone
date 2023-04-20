import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup menu"),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
