import 'package:flutter/material.dart';

class Beads {
  Beads({required this.beadsCount, this.title});

  final String? title;
  final int beadsCount;
  
  List<Color> beadsColors = List.generate(10, (colors) => const Color.fromRGBO(189, 189, 189, 1));
}

class CardBeads extends StatefulWidget {
  const CardBeads({this.title, required this.beads, required this.beadsColors, required this.index, required this.openCard, super.key});

  final String? title;
  final int beads;
  final List<Color> beadsColors;

  final int index;
  final Function(int) openCard;

  @override
  State<CardBeads> createState() => _CardBeadsState();
}

class _CardBeadsState extends State<CardBeads> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.beads; i++)
        GestureDetector(
          onTap: () => {
            setState(() {
              if (widget.beadsColors[i] == const Color.fromRGBO(244, 67, 54, 1)) {
                widget.beadsColors[i] = const Color.fromRGBO(189, 189, 189, 1);
              } else {
                widget.beadsColors[i] = const Color.fromRGBO(244, 67, 54, 1);
                if (i+1 == widget.beads) {
                  widget.openCard(widget.index);
                }
              }
            }),
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: widget.beadsColors[i],
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          )
        ),
      ],
    );
  }
}