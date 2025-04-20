
import 'package:flutter/material.dart';

class CountingTextAnimation extends StatelessWidget {
  final int targetNumber;
  final TextStyle style;

  const CountingTextAnimation({super.key, required this.targetNumber, required this.style});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: targetNumber),
      duration: Duration(seconds: 5),
      builder: (context, value, child) {
        return Text(
          '$value',
          style: style,
        );
      },
    );
  }
}
