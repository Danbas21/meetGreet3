import 'package:flutter/material.dart';

class Circumference extends StatelessWidget {
  final int opacity;

  const Circumference({
    super.key,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 950,
      height: 950,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromARGB(opacity, 83, 158, 228),
          width: 40,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class Circumference2 extends StatelessWidget {
  final double widthC;
  final double heightC;
  final int opacity;

  const Circumference2({
    super.key,
    required this.widthC,
    required this.heightC,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthC,
      height: heightC,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromARGB(opacity, 83, 158, 228),
          width: 65,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class Circumference3 extends StatelessWidget {
  final double widthC;
  final double heightC;
  final int opacity;

  const Circumference3({
    super.key,
    required this.widthC,
    required this.heightC,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthC,
      height: heightC,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromARGB(opacity, 83, 158, 228),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
