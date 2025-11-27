import 'package:catholic_app/views/widgets/expansion_card_widget.dart';
import 'package:flutter/material.dart';

class ExpansionCardListWidget extends StatefulWidget {
  const ExpansionCardListWidget({required this.children, super.key});

  final List<ExpansionCardWidget> children;

  @override
  State<ExpansionCardListWidget> createState() => _ExpansionCardListWidgetState();
}

class _ExpansionCardListWidgetState extends State<ExpansionCardListWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: widget.children,
          )
        ],
      )
    );
  }
}