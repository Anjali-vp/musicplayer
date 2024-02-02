import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    this.action = 'view more', required this.title,
  });
  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        Text(
          action,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize:12,
          ),
        ),

      ],
    );
  }
}