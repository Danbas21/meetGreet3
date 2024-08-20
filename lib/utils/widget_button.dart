import 'package:flutter/material.dart';

class ConstantBounceButton extends StatefulWidget {
  const ConstantBounceButton({super.key});

  @override
  ConstantBounceButtonState createState() => ConstantBounceButtonState();
}

class ConstantBounceButtonState extends State<ConstantBounceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTap: () {
          // Acción al tocar el botón si es necesario
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 92, 74),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Compra tus boletos',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
