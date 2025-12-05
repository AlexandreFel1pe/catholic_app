import 'package:catholic_app/Data/DADOS_ORACOES.dart';
import 'package:catholic_app/views/widgets/card_beads.dart';
import 'package:catholic_app/views/widgets/card_body.dart';
import 'package:catholic_app/views/widgets/card_header.dart';
import 'package:catholic_app/views/widgets/expansion_card.dart';
import 'package:catholic_app/views/widgets/mistery_card.dart';
import 'package:catholic_app/views/widgets/rosary_card_widget.dart';
import 'package:flutter/material.dart';

enum Dias { none, segunda, terca, quarta, quinta, sexta, sabado, domingo }

class RosaryScreen extends StatefulWidget {
  const RosaryScreen({super.key});

  @override
  State<RosaryScreen> createState() => _RosaryScreenState();
}

class _RosaryScreenState extends State<RosaryScreen> {
  final dadosOracoes = DADOS_ORACOES;

  bool isMisteryDay(List<Dias> dias) {
    DateTime date = DateTime.now();

    for (var dia in dias) {
      if (date.weekday == dia.index) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rosary')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RosaryCardWidget(),
              Container(
                width: 500,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: ExpansionCardList(
                    autoOpenNextCard: false,
                    children: [
                      ExpansionCard(
                        isInitiallyExpanded: true,
                        header: CardHeader(
                          title: 'Sinal da Cruz',
                        ), 
                        body: CardBody(
                          content: dadosOracoes['Sinal da Cruz'] as String,
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Oferecimento',
                        ),
                        body: CardBody(
                          content: dadosOracoes['Oferecimento'] as String
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Credo',
                        ),
                        body: CardBody(
                          content: 'Creio em Deus Pai Todo-Poderoso, Criador do Céu e da Terra; e em Jesus Cristo, Seu único Filho, Nosso Senhor; Que foi concebido pelo poder do Espírito Santo. Nasceu da Virgem Maria, padeceu sob Pôncio Pilatos, foi crucificado, morto, sepultado; desceu a mansão dos mortos. Ressuscitou no terceiro dia. Subiu ao Céu, onde está sentado à direita de Deus Pai Todo-Poderoso, de onde há-de vir a julgar os vivos e os mortos. Creio no Espírito Santo, na Santa Igreja Católica, na Comunhão dos Santos, na remissão dos pecados, na ressurreição da carne, na vida eterna. Amem.',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Pai Nosso',
                        ),
                        body: CardBody(
                          content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Ave Maria',
                        ),
                        body: CardBody(
                          content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                        ),
                        beads: [
                          Beads(beadsCount: 3),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Glória',
                        ),
                        body: CardBody(
                          content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Ó meu jesus',
                        ),
                        body: CardBody(
                          content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        isInitiallyExpanded: isMisteryDay([Dias.segunda, Dias.sabado]),
                        header: CardHeader(
                          title: 'Mistérios Gozosos',
                          days: "Segunda e Sábado",
                        ),
                        body: MisteryCard(
                          mistery: [
                            'A Anunciação do Anjo e a Encarnação do Verbo',
                            'A visitação de Maria a sua prima Santa Isabel',
                            'Nascimento do Menino Jesus, na gruta fria em Belém',
                            'A apresentação do Menino Jesus no templo, e a purificação de Maria',
                            'A perda e o encontro do Menino Jesus no templo',
                          ],
                        )
                      ),
                      ExpansionCard(
                        isInitiallyExpanded: isMisteryDay([Dias.quinta]),
                        header: CardHeader(
                          title: 'Mistérios Luminosos',
                          days: "Quinta",
                        ),
                        body: MisteryCard(
                          mistery: [
                            'Batismo de Nosso Senhor Jesus Cristo no rio Jordão',
                            'Primeiro milagre de Jesus transformando a água em vinho nas bodas de Caaná',
                            'Anunciação do Reino de Deus e o convite à conversão',
                            'A transfiguração de Nosso Senhor no Monte Thabor',
                            'A Instituição da Eucaristia na Última Ceia',
                          ],
                        )
                      ),
                      ExpansionCard(
                        isInitiallyExpanded: isMisteryDay([Dias.terca, Dias.sexta]),
                        header: CardHeader(
                          title: 'Mistérios Dolorosos',
                          days: "Terça e Sexta",
                        ),
                        body: MisteryCard(
                          mistery: [
                            'A oração e agonia no Horto das Oliveira',
                            'Flagelação de Nosso Senhor Jesus Cristo',
                            'A coroação de espinhos de Nosso Senhor Jesus Cristo',
                            'Nosso Senhor carregando a Cruz às costas',
                            'A Crucifixão e morte de Nosso Senhor Jesus Cristo',
                          ],
                        )
                      ),
                      ExpansionCard(
                        isInitiallyExpanded: isMisteryDay([Dias.quarta, Dias.domingo]),
                        header: CardHeader(
                          title: 'Mistérios Gloriosos',
                          days: "Quarta e Domingo",
                        ),
                        body: MisteryCard(
                          mistery: [
                            'A oração e agonia no Horto das Oliveira',
                            'A Ascensão de Nosso Senhor Jesus Cristo',
                            'A descida do Espírito Santo',
                            'A Assunção de Nossa Senhora aos Céus de corpo e alma',
                            'A Coroação de Nossa Senhora como Rainha do Céu e da Terra dos Anjos e dos Homens',
                          ],
                        )
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Agradecimento',
                        ),
                        body: CardBody(
                          content: 'Infinitas graças vos damos, Soberana Rainha, pelos benefícios que todos os dias recebemos de vossas mãos liberais. Dignai-vos agora e para sempre tomar-nos debaixo de vosso poderoso amparo e para mais nos obrigar vos saudamos com uma Salve Rainha…',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Salve Rainha',
                        ),
                        body: CardBody(
                          content: 'Salve, Rainha, Mãe de misericórdia, vida, doçura e esperança nossa, salve! A vós bradamos os degredados filhos de Eva. A vós suspiramos, gemendo e chorando neste vale de lágrimas. Eia, pois, advogada nossa, esses vossos olhos misericordiosos a nós volvei, e depois deste desterro mostrai-nos Jesus, bendito fruto do vosso ventre, ó clemente, ó piedosa, ó doce e sempre Virgem Maria. Rogai por nós, Santa Mãe de Deus. Para que sejamos dignos das promessas de Cristo. Amém.',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                      ExpansionCard(
                        header: CardHeader(
                          title: 'Encerramento',
                        ),
                        body: CardBody(
                          content: 'Estivemos, estamos, e estaremos sempre reunidos em nome do Pai, do Filho e do Espirito Santo. Amém.',
                        ),
                        beads: [
                          Beads(beadsCount: 1),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}