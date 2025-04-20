import 'package:flutter/material.dart';
import 'package:moniepointtest/core/constants/colors.dart';

class FabWidget extends StatelessWidget {
  final IconData icon;
  final bool showCircle;
  final Null Function() ontap;

  const FabWidget({super.key, required this.icon, required this.showCircle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap ,
      child: showCircle
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration:
                      BoxDecoration(color: color4, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: color5,
                    ),
                  )),
            )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
                icon,
                color: color5,
              ),
          ),
    );
  }
}
