import 'package:catholic_app/Data/DADOS_ORACOES.dart';
import 'package:catholic_app/views/widgets/expansion_card.dart';
import 'package:flutter/material.dart';

class RosaryScreen extends StatefulWidget {
  RosaryScreen({super.key});

  @override
  State<RosaryScreen> createState() => _RosaryScreenState();
}

class _RosaryScreenState extends State<RosaryScreen> {
  final dadosOracoes = DADOS_ORACOES;

  bool myIsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rosary'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myIsExpanded = !myIsExpanded;
                });
              }, 
              child: Text('Expand')),
            ExpansionCardList(
              children: [
                ExpansionCard(
                  header: Text('Title'),
                  body: Text('Body'),
                  isExpanded: myIsExpanded,
                ),
                ExpansionCard(
                  header: Text('Title'),
                  body: Text('Body'),
                  isExpanded: myIsExpanded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}