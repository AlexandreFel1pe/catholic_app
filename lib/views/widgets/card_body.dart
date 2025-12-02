import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Titulo'),
        Text('Bolinhas'),
      ],
    );
  }
}