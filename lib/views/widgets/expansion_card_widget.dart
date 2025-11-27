import 'package:flutter/material.dart';

class ExpansionCardWidget extends StatefulWidget {
  const ExpansionCardWidget({required this.title, required this.content, this.isInitialyExpanded = true, this.isExpanded = false, super.key});

  final String title;
  final String content;
  final bool isExpanded;
  final bool isInitialyExpanded;

  @override
  State<ExpansionCardWidget> createState() => _ExpansionCardWidgetState();
}

class _ExpansionCardWidgetState extends State<ExpansionCardWidget> {
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.grey[300],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {
              setState(() {
                isExpanded = !isExpanded;
              }),
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      widget.title
                    ),
                  ),
                  Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 8,
              right: 8,
              bottom: 15
            ),
            child: Text(widget.content),
          ),
        ],
      ),
    );
  }
}