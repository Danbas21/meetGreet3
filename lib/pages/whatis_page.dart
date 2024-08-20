import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';

class WhatIsPage extends StatelessWidget {
  const WhatIsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double av = ResponsiveUtil.getMultiplier(context);
    String paragraph =
        '''Meet & Greet Experience será el primer evento de firma de autógrafos en todo México, donde contaremos con la asistencia de los mejores deportistas en la historia de México. Podrás convivir con ellos, tomarte una foto, firmar tu artículo y autenticarlo con la empresa líder en Estados Unidos, BECKETT.''';

    return Scaffold(
      appBar: const BarNavi(),
      drawer: width < 1100 ? const AppDrawer() : null,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              bottom: height /
                  (av == .45
                      ? -14
                      : av == .65
                          ? -20
                          : -25),
              left: width /
                  (av == .45
                      ? 1.8
                      : av == .65
                          ? 2
                          : 2),
              child: Container(
                width: width /
                    (av == .45
                        ? 2.5
                        : av == .65
                            ? 4
                            : 6),
                height: av == .45 ? height / 1.5 : height / 1.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/rectangle_1.png',
                    ),
                    fit: BoxFit.fill,
                    opacity: 0.5,
                  ),
                ),
              ),
            ),
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
              left: -width / 4,
              bottom: -height / 3,
              child: SizedBox(
                width: width / 1.7,
                height: height / 1.2,
                child: const Circumference(
                  opacity: 50,
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
                            : 3.2),
                height: height / 10,
                child: const CirculosEnGrid(),
              ),
            ),
            Positioned(
              right: width / 2,
              top: height / 2,
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
                          : 7),
              bottom: height /
                  (av == 1.0
                      ? 12
                      : av == .65
                          ? 6
                          : 16),
              child: SizedBox(
                width: width /
                    (av == 1.0
                        ? 11
                        : av == .65
                            ? 6
                            : 3.2),
                height: height / 10,
                child: const CirculosEnGrid(),
              ),
            ),
            Positioned(
              top: height / -25,
              right: width / 11,
              child: Container(
                width: width / 1.2,
                height: height / 1.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/rectangle_24.png',
                    ),
                    fit: BoxFit.contain,
                    opacity: 0.5,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: width,
                height: height / 6,
                child: Footer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
