import 'dart:io';

import 'package:flutter/material.dart';

class SelectorButton extends StatefulWidget {
  SelectorButton({required this.text, required this.onTap, super.key});

  final String text;
  final Function onTap;

  @override
  State<SelectorButton> createState() => _SelectorButtonState();
}

class _SelectorButtonState extends State<SelectorButton> {
  bool showHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: Platform.isWindows ? EdgeInsets.only(right: 15) : EdgeInsets.only(),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(
            color: showHover ? Colors.red : Colors.grey,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: showHover ? 20 : 16,
            color: showHover ? Colors.red : Colors.black,
          ),
        ),
      ),
      onTap: () => {
        showHover = false,
        widget.onTap()
      },
      onTapDown: (value) => {
        setState(() {
          showHover = true;
        }),
      },
      onTapCancel: () => {
        setState(() {
          showHover = false;
        }),
      },
    );
  }
}