import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00a9a5), Color(0xFF0b5351), Color(0xFF092327)],
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
          stops: [0.3, 0.6, 0.9],
        ),
      ),
      child: child,
    );
  }
}
