import 'package:flutter/material.dart';

class ExpansionCard {
  ExpansionCard({required this.header, required this.body, this.isExpanded = false});

  final Widget header;
  final Widget body;
  final bool isExpanded;
}

class ExpansionCardList extends StatefulWidget {
  const ExpansionCardList({
    this.children = const <ExpansionCard>[],
    super.key
  });

  final List<ExpansionCard> children;
  Function(int index);
  void Function(int panelIndex, bool isExpanded);

  @override
  State<ExpansionCardList> createState() => _ExpansionCardListState();
}

class _ExpansionCardListState extends State<ExpansionCardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.children.length; i++)
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Card(
              color: Colors.grey[300],
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      print('Tap'),
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: widget.children[i].header,
                    )
                  ),
                  if (widget.children[i].isExpanded)
                  widget.children[i].body,
                ],
              ),
            ),
          ),
      ],
    );
  }
}