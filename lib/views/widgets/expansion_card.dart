import 'package:flutter/material.dart';

class ExpansionCard {
  ExpansionCard({required this.header, required this.body, this.isExpanded = true});

  final Widget header;
  final Widget body;
  bool isExpanded;
}

class ExpansionCardList extends StatefulWidget {
  const ExpansionCardList({
    this.callbackFunction,
    this.children = const <ExpansionCard>[],
    super.key
  });

  final List<ExpansionCard> children;
  final void Function(int index, bool isExpanded)? callbackFunction;

  @override
  State<ExpansionCardList> createState() => _ExpansionCardListState();
}

class _ExpansionCardListState extends State<ExpansionCardList> {
  void collapseAll(int index) {
    for (int i = 0; i < widget.children.length; i++) {
        if (i != index) {
          setState(() {
          widget.children[i].isExpanded = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.children.length; i++)
          Card(
            elevation: 2,
            color: Colors.grey[300],
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => {
                    widget.children[i].isExpanded = !widget.children[i].isExpanded,
                    collapseAll(i),
          
                    if (widget.callbackFunction != null) {
                      widget.callbackFunction
                    }
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.children[i].header,
                        Icon(widget.children[i].isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 35),
                      ],
                    ),
                  )
                ),
                if (widget.children[i].isExpanded)
                Container(
                  alignment: Alignment.centerLeft,
                  child: widget.children[i].body
                ),
              ],
            ),
          ),
      ],
    );
  }
}