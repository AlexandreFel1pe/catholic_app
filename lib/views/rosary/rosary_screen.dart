import 'package:flutter/material.dart';

class RosaryScreen extends StatelessWidget {
  const RosaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rosary'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            child: Column(
              spacing: 5,
              children: [
                Text('Pelo Sinal da Santa Cruz...'),
                Text('Oferecimento'),
                Text('Credo'),
                Text('Pai Nosso'),
                Text('Três Ave Marias'),
                Text('Gloria'),
                Text('Mistério'),
                Text('Pai Nosso'),
                Text('10 Ave Marias'),
                Text('Gloria'),
                Text('Mistério'),
                Text('Pai Nosso'),
                Text('10 Ave Marias'),
                Text('Gloria'),
                Text('Mistério'),
                Text('Pai Nosso'),
                Text('10 Ave Marias'),
                Text('Gloria'),
                Text('Mistério'),
                Text('Pai Nosso'),
                Text('10 Ave Marias'),
                Text('Gloria'),
                Text('Mistério'),
                Text('Pai Nosso'),
                Text('10 Ave Marias'),
                Text('Gloria'),
                Text('Agradecimento'),
                Text('Salve Rainha'),
                Text('Ladainha'),
                Text('Estivemos e Estaremos...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}