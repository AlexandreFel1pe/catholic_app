import 'package:flutter/material.dart';

class ExpansionCard {
  ExpansionCard({
    required this.title,
    required this.content,
    this.isInitialyExpanded = false,
    this.autoCollapse = true})
    : _isExpanded = isInitialyExpanded;

  final String title;
  final String content;
  final bool isInitialyExpanded;
  final bool autoCollapse;

  bool _isExpanded;
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
        if (i != index && widget.children[i].autoCollapse == true) {
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
              elevation: 2,
              color: Colors.grey[300],
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        widget.children[i]._isExpanded = !widget.children[i]._isExpanded;
                      }),

                      if (widget.children[i].autoCollapse == false && widget.children[i]._isExpanded) {
                        collapseAll(i),
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
                          Text(
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            ),
                            widget.children[i].title,
                          ),
                          Icon(widget.children[i]._isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 35),
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
                    child: Text(
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      widget.children[i].content,
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