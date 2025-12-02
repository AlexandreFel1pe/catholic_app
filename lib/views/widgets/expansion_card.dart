import 'package:flutter/material.dart';

class ExpansionCard {
  ExpansionCard({required this.header, required this.body, this.isInitiallyExpanded = false, this.autoOpen = true, this.autoCollapse = true}) : _isExpanded = isInitiallyExpanded;

  final Widget header;
  final Widget body;

  // Settings
  final bool isInitiallyExpanded;
  final bool autoCollapse;
  final bool autoOpen;

  // Local
  bool _isExpanded;
}

class ExpansionCardList extends StatefulWidget {
  const ExpansionCardList({required this.children, this.autoOpenNextCard = false, this.autoCollapseOtherCards = true, super.key});

  final List<ExpansionCard> children;

  // Settings
  final bool autoCollapseOtherCards;
  final bool autoOpenNextCard;

  @override
  State<ExpansionCardList> createState() => _ExpansionCardListState();
}

class _ExpansionCardListState extends State<ExpansionCardList> {

  void autoCollapseOtherCards(int index) {
    if (!widget.children[index]._isExpanded) {
      for (int i = 0; i < widget.children.length; i++) {
        if (i != index && widget.children[i].autoCollapse) {
          setState(() {
            widget.children[i]._isExpanded = false;
          });
        }
      }
    }
  }

  void openOrCloseCard(int i) {
    setState(() {
      if (i < widget.children.length) {
        widget.children[i]._isExpanded = !widget.children[i]._isExpanded;
      }
    });
  }

  void autoOpenNextCard(int index) {
    if (widget.children[index]._isExpanded == false) {
      if (index + 1 < widget.children.length && widget.children[index+1]._isExpanded == false && widget.children[index+1].autoOpen) {
        openOrCloseCard(index+1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.children.length; i++)
        Card(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => {
                  if (widget.autoCollapseOtherCards) {
                    autoCollapseOtherCards(i),
                  },

                  openOrCloseCard(i),

                  if (widget.autoOpenNextCard) {
                    autoOpenNextCard(i),
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  width: double.infinity,
                  child: widget.children[i].header,
                ),
              ),
              if (widget.children[i]._isExpanded)
              widget.children[i].body,
            ],
          ),
        )
      ],
    );
  }
}