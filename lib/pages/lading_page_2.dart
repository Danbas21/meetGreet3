import 'package:flutter/material.dart';
import 'package:flutter_app/utils/animation_main.dart';
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
        ? 8.2
        : av == .65
            ? 5.2
            : 4;

    double variant = av == 1.0
        ? 10
        : av == .65
            ? 8
            : 5;

    return SizedBox(
      width: width,
      height: height /
          (av == 1.0
              ? 1.6
              : av == .65
                  ? 1.7
                  : 2.63),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(26, 163, 224, 217)),
              width: width,
              height: height /
                  (av == 1.0
                      ? 1.5
                      : av == .65
                          ? 1.7
                          : 2.63),
              child: Stack(
                children: [
                  Positioned(
                    right: -width / 4,
                    top: -height / 3,
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
                            ? 12
                            : av == .65
                                ? 20
                                : 7),
                    top: height /
                        (av == 1.0
                            ? 12
                            : av == .65
                                ? 10
                                : 16),
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
                            ? -4
                            : av == .65
                                ? -21
                                : 6.5),
                    right: width /
                        (av == 1.0
                            ? 2.2
                            : av == .65
                                ? 10
                                : 0),
                    child: SizedBox(
                      width: av == 1.0
                          ? width / 2
                          : av == .65
                              ? width / 1.3
                              : width,
                      height: height * 1.1,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: (width / variant),
                                height: height,
                                child: const AnimationMain(
                                  img: 'assets/images/rectangle.png',
                                  wiseAnimation: 600,
                                ),
                              ),
                            ),
                            Positioned(
                              left: (width / spaceElement),
                              bottom: 0,
                              child: SizedBox(
                                width: (width / variant),
                                height: height,
                                child: const AnimationMain(
                                  img: 'assets/images/rectangle_13.png',
                                  wiseAnimation: -600,
                                ),
                              ),
                            ),
                            Positioned(
                              left: (width / spaceElement) * 2,
                              top: 0,
                              child: SizedBox(
                                width: (width / variant),
                                height: height,
                                child: const AnimationMain(
                                  img: 'assets/images/rectangle_10.png',
                                  wiseAnimation: 600,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: SizedBox(
                                width: (width / variant),
                                height: height,
                                child: const AnimationMain(
                                  img: 'assets/images/rectangl.png',
                                  wiseAnimation: -600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: width / -10,
                    top: 0,
                    child: SizedBox(
                        width: width / 1.5,
                        height: height / 1.5,
                        child: Image.asset('assets/images/maps.png')),
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
