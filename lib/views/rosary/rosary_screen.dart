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
      body: Center(
        child: Column(
          children: [
            ExpansionCardList(
              children: [
                ExpansionCard(
                  header: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Title'),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Pelo sinal da santa cruz, livrai nos Deus dos nossos inimigos, Em nome do Pai, e do Filho, e do Espirito Santo. Amén.'),
                  ),
                ),
                ExpansionCard(
                  header: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Title'),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Body'),
                  ),
                ),ExpansionCard(
                  header: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Title'),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Body'),
                  ),
                  isExpanded: false,
                ),ExpansionCard(
                  header: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Title'),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Body'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}