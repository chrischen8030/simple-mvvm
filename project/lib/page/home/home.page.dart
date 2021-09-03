import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('1'),
            ),
            Container(
              child: Text('1'),
            ),
            Container(
              child: Text('1'),
            ),
            Container(
              child: Text('1'),
            ),
            Container(
              child: Text('1'),
            )
          ],
        ),
      ),
    );
  }
}
