import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_utils.dart';

class CirculosEnGrid extends StatelessWidget {
  const CirculosEnGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double multiplier = ResponsiveUtil.getMultiplier(context);

    final double dpi = MediaQuery.of(context).devicePixelRatio;
    double cmToPx = 35.7952755906;
    final double containerSize = 20 * cmToPx / dpi;

    return SizedBox(
      width: containerSize * multiplier,
      height: containerSize * multiplier,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: 28,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(120, 11, 26, 114),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
