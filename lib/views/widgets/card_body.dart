import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({required this.content, super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.justify,
            content
          ),
        ],
      ),
    );
  }
}