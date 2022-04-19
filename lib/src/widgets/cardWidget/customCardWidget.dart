import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;

  CustomCardWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
