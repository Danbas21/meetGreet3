import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pasarela_pagos.dart';
import 'package:flutter_app/utils/screen_utils.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final double av = ResponsiveUtil.getMultiplier(context);

    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentGatewayScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 92, 74),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Compra\ntus boletos',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: width / (av == 1.0 ? 45 : 35),
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
