import 'package:flutter/material.dart';

class ExpansionCard {
  ExpansionCard({
    required this.title,
    required this.content,
    this.beadsCounts = 0,
    this.expansionCardList,
    this.isInitiallyExpanded = false,
    this.autoCollapse = true,
    this.titleFontSize,
    this.contentFontSize,
    })
    : _isExpanded = isInitiallyExpanded;

  final String title;
  final String content;
  final int beadsCounts;
  final ExpansionCardList? expansionCardList;
  final bool isInitiallyExpanded;
  final bool autoCollapse;

  bool _isExpanded;

  List<Color> beadsColors = List.generate(10, (colors) => const Color.fromRGBO(189, 189, 189, 1));

  // Style
  final double? titleFontSize;
  final double? contentFontSize;
}

class ExpansionCardList extends StatefulWidget {
  const ExpansionCardList({
    this.callbackFunction,
    this.children = const <ExpansionCard>[],
    this.elevation = 2,
    this.color = const Color.fromRGBO(224, 224, 224, 1),
    this.titleFontSize = 16,
    this.contentFontSize = 14,
    super.key
  });

  final List<ExpansionCard> children;
  final void Function(int index, bool isExpanded)? callbackFunction;

  // Style
  final double elevation;
  final Color color;
  final double titleFontSize;
  final double contentFontSize;

  @override
  State<ExpansionCardList> createState() => _ExpansionCardListState();
}

class _ExpansionCardListState extends State<ExpansionCardList> {
  void collapseAll(int index, bool collapseAll) {
    for (int i = 0; i < widget.children.length; i++) {
        if ((i != index && widget.children[i].autoCollapse == true) || (collapseAll == true && i != index)) {
          setState(() {
            widget.children[i]._isExpanded = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < widget.children.length; i++)
            Card(
              elevation: widget.elevation,
              color: widget.color,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        widget.children[i]._isExpanded = !widget.children[i]._isExpanded;
                      }),
    
                      if (widget.children[i].autoCollapse == true && widget.children[i]._isExpanded) {
                        collapseAll(i, false),
                      },
    
                      if (widget.children[i].autoCollapse == false && widget.children[i]._isExpanded == true) {
                        collapseAll(i, true),
                      },
            
                      if (widget.callbackFunction != null) {
                        widget.callbackFunction!(i, widget.children[i]._isExpanded),
                      },
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.1,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ), 
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              style: TextStyle(
                                fontSize: widget.children[i].titleFontSize ?? widget.titleFontSize,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                              ),
                              widget.children[i].title,
                            ),
                          ),
                          Flexible(child: Icon(widget.children[i]._isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 35)),
                        ],
                      ),
                    )
                  ),
                  if (widget.children[i]._isExpanded)
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        widget.children[i].expansionCardList ?? Text(
                          style: TextStyle(
                            fontSize: widget.children[i].contentFontSize ?? widget.contentFontSize,
                          ),
                          widget.children[i].content,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              for (int j = 0; j < widget.children[i].beadsCounts; j++)
                                GestureDetector(
                                onTap: () => {
                                  setState(() {
                                    if (widget.children[i].beadsColors[j] != const Color.fromRGBO(76, 175, 80, 1)) {
                                      widget.children[i].beadsColors[j] = const Color.fromRGBO(76, 175, 80, 1);

                                      if (j == widget.children[i].beadsCounts - 1) {
                                        widget.children[i]._isExpanded = false;

                                        if (i+1 < widget.children.length) {
                                          if (widget.children[i+1].expansionCardList != null) {
                                            print('Card List aninhado');

                                            int count = i;

                                            bool childIsNotCardList = false;
                                            while (!childIsNotCardList) {
                                              if (widget.children[count+1].expansionCardList == null) {
                                                childIsNotCardList = true;
                                                widget.children[count+1]._isExpanded = true;
                                                print('Não e card list $count');
                                                break;
                                              }

                                              count++;
                                            }
                                          } else {
                                            widget.children[i+1]._isExpanded = true;
                                          }
                                        }
                                      }

                                      if (i == widget.children.length - 1) {
                                        if (j == (widget.children[i].beadsCounts - 1)) {
                                          //
                                        }
                                      }
                                    } else {
                                      widget.children[i].beadsColors[j] = const Color.fromRGBO(189, 189, 189, 1);
                                    }
                                  }),
                                },
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  //color: Colors.grey,
                                  decoration: BoxDecoration(
                                    color: widget.children[i].beadsColors[j],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}