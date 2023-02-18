import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatableImage extends StatefulWidget {
  const RotatableImage({
    Key? key,
    required this.rotAngle,
    required this.imageURL,
  }) : super(key: key);

  final double rotAngle;
  final String imageURL;

  @override
  State<RotatableImage> createState() => _RotatableImageState();
}

class _RotatableImageState extends State<RotatableImage> {
  double opacity = 0;
  @override
  void initState() {
    updateOpac();
    super.initState();
  }

  void updateOpac() async {
    await Future.delayed(const Duration(milliseconds: 500));
    opacity = opacity == 0 ? 1 : 0;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: widget.rotAngle * (math.pi / 180),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.asset(
              widget.imageURL,
              height: 250,
              // width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
