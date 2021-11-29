import 'package:flutter/material.dart';

class TelaImagens extends StatefulWidget {
  @override
  _TelaImagensState createState() => _TelaImagensState();
}

class _TelaImagensState extends State<TelaImagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 550,
        child: ListView(
          children: [
            Container(
              height: 560,
              child: Image.asset(
                'assets/images/camera.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
