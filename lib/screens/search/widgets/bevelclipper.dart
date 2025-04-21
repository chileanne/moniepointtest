import 'package:flutter/material.dart';

class BevelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double bevel = 10.0;

    Path path = Path();
    path.moveTo(0, bevel);
    path.lineTo(0, size.height - bevel);
    path.lineTo(bevel, size.height);
    path.lineTo(size.width - bevel, size.height);
    path.lineTo(size.width, size.height - bevel);
    path.lineTo(size.width, bevel);
    path.lineTo(size.width - bevel, 0);
    path.lineTo(bevel, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
