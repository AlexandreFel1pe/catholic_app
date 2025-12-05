import 'package:catholic_app/views/widgets/card_beads.dart';
import 'package:flutter/material.dart';

class ExpansionCard {
  ExpansionCard({required this.header, required this.body, this.beads, this.isInitiallyExpanded = false, this.autoOpen = true, this.autoCollapse = true}) : _isExpanded = isInitiallyExpanded;

  final Widget header;
  final Widget body;
  final List<Beads>? beads;

  // Settings
  final bool isInitiallyExpanded;
  final bool autoCollapse;
  final bool autoOpen;

  // Local
  bool _isExpanded;
}

class ExpansionCardList extends StatefulWidget {
  const ExpansionCardList({required this.children, this.autoOpenNextCard = true, this.autoCollapseOtherCards = true, super.key});

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

  void goToNextCard(int i) {
    if (i + 1 < widget.children.length && widget.children[i+1]._isExpanded == false && widget.children[i+1].autoOpen) {
      autoCollapseOtherCards(i+1);
      openOrCloseCard(i+1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.children.length; i++)
        Card(
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          child: widget.children[i].header,
                        ),
                      ),
                      Icon(
                        widget.children[i]._isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.children[i]._isExpanded)
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.4,
                      color: Colors.blueGrey,
                    ),
                  ),
                ), 
                child: Column(
                  spacing: 20,
                  children: [
                    widget.children[i].body,
                    if (widget.children[i].beads != null)
                    Column(
                      spacing: 5,
                      children: [
                        for (int j = 0; j < widget.children[i].beads!.length; j++)
                        CardBeads(
                          title: widget.children[i].beads![j].title,
                          beads: widget.children[i].beads![j].beadsCount,
                          beadsColors: widget.children[i].beads![j].beadsColors,
                          index: i,
                          openCard: goToNextCard),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}