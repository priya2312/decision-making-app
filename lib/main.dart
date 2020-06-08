import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            'Coin Toss',
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: MyCoin(),
        ),
      ),
    );
  }
}

class MyCoin extends StatefulWidget {
  @override
  _MyCoinState createState() => _MyCoinState();
}

class _MyCoinState extends State<MyCoin> {
  int choice = -1;

  void changeIcon() {
    setState(() {
      print('Tossing...');
      choice = Random().nextInt(2);
      print(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Click on the coin to make a toss',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        RawMaterialButton(
          onPressed: () {
            changeIcon();
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            (choice == -1)
                ? Icons.thumbs_up_down
                : ((choice == 0) ? Icons.thumb_up : Icons.thumb_down),
            size: 150.0,
          ),
          padding: EdgeInsets.all(50.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }
}
