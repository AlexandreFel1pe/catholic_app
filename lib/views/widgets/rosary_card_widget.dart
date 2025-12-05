import 'package:catholic_app/views/widgets/card_header.dart';
import 'package:catholic_app/views/widgets/expansion_card.dart';
import 'package:flutter/material.dart';

class RosaryCardWidget extends StatelessWidget {
  const RosaryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ExpansionCardList(
        children: [
          ExpansionCard(
            header: CardHeader(title: 'Titulo'),
            body: ExpansionCardList(
              children: [
                ExpansionCard(header: Text('data'), body: Text('data'))
              ],
            ),
          ),
        ]
      ),
    );
  }
}