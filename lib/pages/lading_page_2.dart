import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_utils.dart';

import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';

class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double av = ResponsiveUtil.getMultiplier(context);

    double spaceElement = av == 1.0
        ? 10
        : av == .65
            ? 5.6
            : 5.2;

    double variant = av == 1.0
        ? 11
        : av == .65
            ? 6
            : 6;

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
                    left: width / 2,
                    bottom: height /
                        (av == 1.0
                            ? -5
                            : av == .65
                                ? 25
                                : 2),
                    child: SizedBox(
                      width: width / 1.7,
                      height: height / 1.2,
                      child: const Circumference(
                        opacity: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    right: width /
                        (av == 1.0
                            ? 7
                            : av == .65
                                ? 40
                                : 20),
                    top: height /
                        (av == 1.0
                            ? 5
                            : av == .65
                                ? 10
                                : 15),
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
                    top: height /
                        (av == 1.0
                            ? -5
                            : av == .65
                                ? 90
                                : 15),
                    left: av == 1.0
                        ? 25
                        : av == .65
                            ? 10
                            : 10,
                    child: SizedBox(
                      width: av == .45
                          ? width / 1.35
                          : av == .65
                              ? width / 1.43
                              : width / 2.5,
                      height: height * 1.1,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: (width / variant),
                              height: height,
                              child: Image.asset(
                                'assets/images/rectangle.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            left: (width / spaceElement),
                            bottom: 0,
                            child: SizedBox(
                              width: (width / variant),
                              height: height,
                              child: Image.asset(
                                'assets/images/rectangle_13.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            left: (width / spaceElement) * 2,
                            top: 0,
                            child: SizedBox(
                              width: (width / variant),
                              height: height,
                              child: Image.asset(
                                'assets/images/rectangle_9.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SizedBox(
                              width: (width / variant),
                              height: height,
                              child: Image.asset(
                                'assets/images/rectangl.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height /
                        (av == 1.0
                            ? -10
                            : av == .65
                                ? 13
                                : 6),
                    left: width /
                        (av == 1.0
                            ? 3
                            : av == .65
                                ? 2.3
                                : 10),
                    child: SizedBox(
                      width: width / 1.5,
                      height: height / 1.5,
                      child: Image.asset(
                        'assets/images/maps.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
