import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({required this.title, this.days, this.optional = false, super.key});

  final String title;
  final String? days;
  final bool optional;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 15,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        if (mediaQuery.size.width > 356 && days != null && optional == true)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 5,
          children: [
            if (days != null)
            Text(
              days!,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            if (optional)
            Text(
              'Opcional',
              style: TextStyle(
                color: Colors.green[900],
              ),
            ),
          ],
        ),
      ],
    );
  }
}