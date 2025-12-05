import 'package:catholic_app/views/widgets/card_beads.dart';
import 'package:catholic_app/views/widgets/card_body.dart';
import 'package:catholic_app/views/widgets/card_header.dart';
import 'package:catholic_app/views/widgets/expansion_card.dart';
import 'package:flutter/material.dart';

class MisteryCard extends StatelessWidget {
  const MisteryCard({required this.mistery, super.key});

  final List<String> mistery;

  @override
  Widget build(BuildContext context) {
    return ExpansionCardList(
      autoOpenNextCard: false,
      children: [
        ExpansionCard(
          isInitiallyExpanded: true,
          header: CardHeader(
              title: '1º Mistério Contemplamos',
              subTitle: mistery[0],
            ), 
            body: ExpansionCardList(
              children: [
                ExpansionCard(
                  header: CardHeader(title: 'Pai Nosso'),
                  body: CardBody(
                    content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ave Maria'),
                  body: CardBody(
                    content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 10),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Glória'),
                  body: CardBody(
                    content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ó meu Jesus'),
                  body: CardBody(
                    content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
              ],
            ),
        ),
        ExpansionCard(
          header: CardHeader(
              title: '2º Mistério Contemplamos',
              subTitle: mistery[1],
            ), 
            body: ExpansionCardList(
              children: [
                ExpansionCard(
                  header: CardHeader(title: 'Pai Nosso'),
                  body: CardBody(
                    content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ave Maria'),
                  body: CardBody(
                    content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 10),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Glória'),
                  body: CardBody(
                    content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ó meu Jesus'),
                  body: CardBody(
                    content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
              ],
            ),
        ),
        ExpansionCard(
          header: CardHeader(
              title: '3º Mistério Contemplamos',
              subTitle: mistery[2],
            ), 
            body: ExpansionCardList(
              children: [
                ExpansionCard(
                  header: CardHeader(title: 'Pai Nosso'),
                  body: CardBody(
                    content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ave Maria'),
                  body: CardBody(
                    content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 10),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Glória'),
                  body: CardBody(
                    content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ó meu Jesus'),
                  body: CardBody(
                    content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
              ],
            ),
        ),
        ExpansionCard(
          header: CardHeader(
              title: '4º Mistério Contemplamos',
              subTitle: mistery[3],
            ), 
            body: ExpansionCardList(
              children: [
                ExpansionCard(
                  header: CardHeader(title: 'Pai Nosso'),
                  body: CardBody(
                    content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ave Maria'),
                  body: CardBody(
                    content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 10),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Glória'),
                  body: CardBody(
                    content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ó meu Jesus'),
                  body: CardBody(
                    content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
              ],
            ),
        ),
        ExpansionCard(
          header: CardHeader(
              title: '5º Mistério Contemplamos',
              subTitle: mistery[4],
            ), 
            body: ExpansionCardList(
              children: [
                ExpansionCard(
                  header: CardHeader(title: 'Pai Nosso'),
                  body: CardBody(
                    content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ave Maria'),
                  body: CardBody(
                    content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 10),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Glória'),
                  body: CardBody(
                    content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
                ExpansionCard(
                  header: CardHeader(title: 'Ó meu Jesus'),
                  body: CardBody(
                    content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                  ),
                  beads: [
                    Beads(beadsCount: 1),
                  ]
                ),
              ],
            ),
        ),
      ],
    );
  }
}