import 'package:catholic_app/Data/DADOS_ORACOES.dart';
import 'package:catholic_app/views/widgets/card_body.dart';
import 'package:catholic_app/views/widgets/card_header.dart';
import 'package:catholic_app/views/widgets/expansion_card.dart';
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
        child: Container(
          width: 500,
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: ExpansionCardList(
              children: [
                ExpansionCard(
                  header: CardHeader(
                    title: 'Sinal da Cruz',
                    days: 'Segunda e Quinta',
                    optional: true,
                  ), 
                  body: CardBody(

                  ),
                ),

                ExpansionCard(
                  header: CardHeader(
                    title: 'Sinal da Cruz',
                    days: 'Segunda e Quinta',
                    optional: true,
                  ),
                  body: ExpansionCardList(
                    children: [
                      ExpansionCard(
                        header: CardHeader(
                            title: 'Sinal da Cruz',
                            days: 'Segunda e Quinta',
                            optional: true,
                          ), 
                          body: CardBody(

                        ),
                      ),
                      ExpansionCard(
                        header: CardHeader(
                            title: 'Sinal da Cruz',
                            days: 'Segunda e Quinta',
                            optional: true,
                          ), 
                          body: CardBody(
                            
                        ),
                      ),
                      ExpansionCard(
                        header: CardHeader(
                            title: 'Sinal da Cruz',
                            days: 'Segunda e Quinta',
                            optional: true,
                          ), 
                          body: CardBody(
                            
                        ),
                      ),
                      ExpansionCard(
                        header: CardHeader(
                            title: 'Sinal da Cruz',
                            days: 'Segunda e Quinta',
                            optional: true,
                          ), 
                          body: CardBody(
                            
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          /*ExpansionCardList(
            children: [
              ExpansionCard(
                title: 'Sinal da Cruz',
                content: dadosOracoes['Sinal da Cruz'] as String,
                beadsCounts: 1,
                isInitiallyExpanded: true,
              ),
              ExpansionCard(
                title: 'Oferecimento',
                content: dadosOracoes['Oferecimento'] as String,
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Credo',
                content: 'Creio em Deus Pai Todo-Poderoso, Criador do Céu e da Terra; e em Jesus Cristo, Seu único Filho, Nosso Senhor; Que foi concebido pelo poder do Espírito Santo. Nasceu da Virgem Maria, padeceu sob Pôncio Pilatos, foi crucificado, morto, sepultado; desceu a mansão dos mortos. Ressuscitou no terceiro dia. Subiu ao Céu, onde está sentado à direita de Deus Pai Todo-Poderoso, de onde há-de vir a julgar os vivos e os mortos. Creio no Espírito Santo, na Santa Igreja Católica, na Comunhão dos Santos, na remissão dos pecados, na ressurreição da carne, na vida eterna. Amem.',
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Pai Nosso ',
                content: 'Pai nosso, que estais nos Céus, santificado seja o Vosso Nome; venha a nós o Vosso Reino, seja feita a Vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje; perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido; e não nos deixeis cair em tentação, mas livrai-nos do mal.',
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Ave Maria',
                content: 'Ave Maria, cheia de graça, o Senhor é convosco; bendita sois Vós entre as mulheres e bendito é o fruto do Vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte. Amem.',
                beadsCounts: 3,
              ),
              ExpansionCard(
                title: 'Glória',
                content: 'Glória ao Pai, ao Filho e ao Espírito Santo. Assim como era no princípio, agora e sempre, pelos séculos dos séculos. Amem.',
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Ó meu Jesus',
                content: 'Ó meu Jesus, perdoai-nos e livrai-nos do fogo do inferno; levai as almas todas para o Céu, principalmente as que mais precisarem.',
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Mistérios Gozosos (Segunda-feira e Sábado)',
                content: '',
                isInitiallyExpanded: isMisteryDay([Dias.segunda, Dias.sabado]),
                autoCollapse: false,
                expansionCardList: ExpansionCardList(
                  titleFontSize: 18,
                  contentFontSize: 16,
                  children: [
                    ExpansionCard(title: '1º Mistério Contemplamos', content: 'A Anunciação do Anjo e a Encarnação do Verbo', beadsCounts: 10, isInitiallyExpanded: true),
                    ExpansionCard(title: '2º Mistério Contemplamos', content: 'A visitação de Maria a sua prima Santa Isabel', beadsCounts: 10),
                    ExpansionCard(title: '3º Mistério Contemplamos', content: 'Nascimento do Menino Jesus, na gruta fria em Belém', beadsCounts: 10),
                    ExpansionCard(title: '4º Mistério Contemplamos', content: 'A apresentação do Menino Jesus no templo, e a purificação de Maria', beadsCounts: 10),
                    ExpansionCard(title: '5º Mistério Contemplamos', content: 'A perda e o encontro do Menino Jesus no templo', beadsCounts: 10),
                  ],
                ),
              ),
              ExpansionCard(
                title: 'Mistérios Luminosos (Quinta-feira)',
                content: '',
                isInitiallyExpanded: isMisteryDay([Dias.quinta]),
                autoCollapse: false,
                expansionCardList: ExpansionCardList(
                  titleFontSize: 18,
                  contentFontSize: 16,
                  children: [
                    ExpansionCard(title: '1º Mistério Contemplamos', content: 'Batismo de Nosso Senhor Jesus Cristo no rio Jordão', beadsCounts: 10, isInitiallyExpanded: true),
                    ExpansionCard(title: '2º Mistério Contemplamos', content: 'Primeiro milagre de Jesus transformando a água em vinho nas bodas de Caaná', beadsCounts: 10),
                    ExpansionCard(title: '3º Mistério Contemplamos', content: 'Anunciação do Reino de Deus e o convite à conversãontent', beadsCounts: 10),
                    ExpansionCard(title: '4º Mistério Contemplamos', content: 'A transfiguração de Nosso Senhor no Monte Thabor', beadsCounts: 10),
                    ExpansionCard(title: '5º Mistério Contemplamos', content: 'A Instituição da Eucaristia na Última Ceia', beadsCounts: 10),
                  ],
                ),
              ),
              ExpansionCard(
                title: 'Mistérios Dolorosos (Terça e Sexta-feira)',
                content: '',
                isInitiallyExpanded: isMisteryDay([Dias.terca, Dias.sexta]),
                autoCollapse: false,
                expansionCardList: ExpansionCardList(
                  titleFontSize: 18,
                  contentFontSize: 16,
                  children: [
                    ExpansionCard(title: '1º Mistério Contemplamos', content: 'A oração e agonia no Horto das Oliveira', beadsCounts: 10, isInitiallyExpanded: true),
                    ExpansionCard(title: '2º Mistério Contemplamos', content: 'Flagelação de Nosso Senhor Jesus Cristo', beadsCounts: 10),
                    ExpansionCard(title: '3º Mistério Contemplamos', content: 'A coroação de espinhos de Nosso Senhor Jesus Cristo', beadsCounts: 10),
                    ExpansionCard(title: '4º Mistério Contemplamos', content: 'Nosso Senhor carregando a Cruz às costas', beadsCounts: 10),
                    ExpansionCard(title: '5º Mistério Contemplamos', content: 'A Crucifixão e morte de Nosso Senhor Jesus Cristo', beadsCounts: 10),
                  ],
                ),
              ),
              ExpansionCard(
                title: 'Mistérios Gloriosos (Quarta-feira e Domingo)',
                content: '',
                isInitiallyExpanded: isMisteryDay([Dias.quarta, Dias.domingo]),
                autoCollapse: false,
                expansionCardList: ExpansionCardList(
                  titleFontSize: 18,
                  contentFontSize: 16,
                  children: [
                    ExpansionCard(title: '1º Mistério Contemplamos', content: 'A Ressurreição de Nosso Senhor Jesus Cristo', beadsCounts: 10, isInitiallyExpanded: true),
                    ExpansionCard(title: '2º Mistério Contemplamos', content: 'A Ascensão de Nosso Senhor Jesus Cristo', beadsCounts: 10),
                    ExpansionCard(title: '3º Mistério Contemplamos', content: 'A descida do Espírito Santo', beadsCounts: 10),
                    ExpansionCard(title: '4º Mistério Contemplamos', content: 'A Assunção de Nossa Senhora aos Céus de corpo e alma', beadsCounts: 10),
                    ExpansionCard(title: '5º Mistério Contemplamos', content: 'A Coroação de Nossa Senhora como Rainha do Céu  e da Terra dos Anjos e dos Homens', beadsCounts: 10),
                  ],
                ),
              ),
              ExpansionCard(
                title: 'Agradecimento',
                content: 'Infinitas graças vos damos, Soberana Rainha, pelos benefícios que todos os dias recebemos de vossas mãos liberais. Dignai-vos agora e para sempre tomar-nos debaixo de vosso poderoso amparo e para mais nos obrigar vos saudamos com uma Salve Rainha…',
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Salve Rainha',
                content: 'Salve, Rainha, Mãe de misericórdia, vida, doçura e esperança nossa, salve! A vós bradamos os degredados filhos de Eva. A vós suspiramos, gemendo e chorando neste vale de lágrimas. Eia, pois, advogada nossa, esses vossos olhos misericordiosos a nós volvei, e depois deste desterro mostrai-nos Jesus, bendito fruto do vosso ventre, ó clemente, ó piedosa, ó doce e sempre Virgem Maria. Rogai por nós, Santa Mãe de Deus. Para que sejamos dignos das promessas de Cristo. Amém.',
                beadsCounts: 1,
              ),
              ExpansionCard(
                title: 'Encerramento',
                content: 'Estivemos, estamos, e estaremos sempre reunidos em nome do Pai, do Filho e do Espirito Santo. Amém.',
                beadsCounts: 1,
              ),
            ],
          ),*/
        ),
      ),
    );
  }
}