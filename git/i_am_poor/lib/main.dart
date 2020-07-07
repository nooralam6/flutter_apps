import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'I Am Poor',
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/coal.png'),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
    ),
  );
}
