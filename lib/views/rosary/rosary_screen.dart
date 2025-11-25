import 'package:flutter/material.dart';

class RosaryScreen extends StatelessWidget {
  const RosaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rosary'),
      ),
      body: Column(
        children: [
          Text('Body'),
        ],
      ),
    );
  }
}