import 'package:flutter/material.dart';

class BoxText extends StatelessWidget {
  final String labelText;
  final double widthText;
  final double heightText;

  const BoxText({
    super.key,
    required this.labelText,
    required this.widthText,
    required this.heightText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: widthText,
      height: heightText,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const BorderDirectional(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.5),
            child: Text(
              labelText,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Arial',
              ),
            ),
          ),
          const TextField(
            cursorHeight: 14,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
