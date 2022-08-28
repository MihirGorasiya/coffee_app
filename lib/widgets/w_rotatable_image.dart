import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatableImage extends StatelessWidget {
  const RotatableImage({
    Key? key,
    required this.rotAngle,
    required this.imageURL,
  }) : super(key: key);

  final double rotAngle;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotAngle * (math.pi / 180),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.asset(
            imageURL,
            height: 250,
            // width: 250,
          ),
        ),
      ),
    );
  }
}
