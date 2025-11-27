import 'package:catholic_app/Data/DADOS_ORACOES.dart';
import 'package:catholic_app/views/widgets/expansion_card.dart';
import 'package:flutter/material.dart';

class RosaryScreen extends StatefulWidget {
  const RosaryScreen({super.key});

  @override
  State<RosaryScreen> createState() => _RosaryScreenState();
}

class _RosaryScreenState extends State<RosaryScreen> {
  final dadosOracoes = DADOS_ORACOES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rosary'),
      ),
      body: ExpansionCardList(
        children: [
          ExpansionCard(title: 'Sinal da Cruz', content: dadosOracoes['Sinal da Cruz'] as String, isInitialyExpanded: true, autoCollapse: false),
          ExpansionCard(title: 'Oferecimento', content: dadosOracoes['Oferecimento'] as String, isInitialyExpanded: true),
          ExpansionCard(title: 'Title', content: 'Content'),
          ExpansionCard(title: 'Title', content: 'Content'),
        ],
      ),
    );
  }
}