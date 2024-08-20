import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/hover_animation.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';

class LadingPage3 extends StatelessWidget {
  const LadingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double av = ResponsiveUtil.getMultiplier(context);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Positioned(
                      left: width / 10,
                      top: height /
                          (av == 1.0
                              ? 1.5
                              : av == .65
                                  ? 1.5
                                  : 1.5),
                      child: SizedBox(
                        width: width / 1.7,
                        height: height / 1.2,
                        child: const Circumference(
                          opacity: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: width / 4,
                      bottom: height /
                          (av == 1.0
                              ? 4
                              : av == .65
                                  ? 4
                                  : 5),
                      child: SizedBox(
                        width: width / 1.7,
                        height: height / 1.2,
                        child: const Circumference(
                          opacity: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      left: width /
                          (av == 1.0
                              ? 12
                              : av == .65
                                  ? 20
                                  : 15),
                      top: height /
                          (av == 1.0
                              ? 1.3
                              : av == .65
                                  ? 10
                                  : 4),
                      child: SizedBox(
                        width: width /
                            (av == 1.0
                                ? 11
                                : av == .65
                                    ? 6
                                    : 4),
                        height: height / 10,
                        child: const CirculosEnGrid(),
                      ),
                    ),
                    Positioned(
                      right: width /
                          (av == 1.0
                              ? 12
                              : av == .65
                                  ? 20
                                  : 5),
                      top: height /
                          (av == 1.0
                              ? 12
                              : av == .65
                                  ? 10
                                  : 8),
                      child: SizedBox(
                        width: width /
                            (av == 1.0
                                ? 11
                                : av == .65
                                    ? 6
                                    : 4),
                        height: height / 10,
                        child: const CirculosEnGrid(),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: height /
                          (av == 1.0
                              ? 10
                              : av == .65
                                  ? 7
                                  : 16),
                      child: SizedBox(
                        width: width,
                        height: height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width / 3.5,
                              height: height,
                              child: HoverContainer(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/rectangle_20.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      'MEET AND GREET',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 50,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 3,
                              height: height,
                              child: HoverContainer(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/rectangle_6.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      'PRÓXIMOS EVENTOS',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 50,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 3.5,
                              child: HoverContainer(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Image.asset(
                                      'assets/images/rectangle_3.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      'ARTÍCULOS COLECCIONABLES',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width / 60,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

final List<String> listWidget = [
  'assets/images/rectangle_3.png',
  'assets/images/rectangle_20.jpeg',
  'assets/images/rectangle_6.png',
  'assets/images/rectangle_4.png',
  'assets/images/rectangle_3.png',
];
