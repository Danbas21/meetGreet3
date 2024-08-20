import 'package:flutter/material.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/utils/widget_button.dart';

import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';
import 'package:intl/intl.dart';

class SellTicket extends StatelessWidget {
  const SellTicket({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double av = ResponsiveUtil.getMultiplier(context);

    double fontSize = av == 1.0
        ? 1
        : av == 0.65
            ? 1.5
            : 2;

    String paragraph =
        '''ENTRADA PARA AMBOS DÍAS.\nTENDRÁS ACCESO A TODOS LOS DEPORTISTAS.\nPODRÁS LLEVAR TU ARTÍCULO PREFERIDO PARA QUE LO AUTOGRAFÍEN.\nFILAS PREFERENTES PARA LOS AUTÓGRAFOS Y FOTOGRAFÍAS.\nARTÍCULOS DE REGALO.\n5 AUTÓGRAFOS DEL EVENTO PARA AUTENTIFICAR CON BECKETT.''';

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
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
              left: -200,
              bottom: 1100,
              child: SizedBox(
                width: 600 * av,
                height: 600 * av,
                child: Circumference3(
                  widthC: width / 1.7,
                  heightC: height / 1.2,
                  opacity: 225,
                ),
              ),
            ),
            Positioned(
              right: -250,
              top: 1000,
              child: SizedBox(
                width: 800 * av,
                height: 800 * av,
                child: Circumference(
                  opacity: 100,
                ),
              ),
            ),
            Positioned(
              left: 90,
              top: 150,
              child: SizedBox(
                width: 190 * av,
                height: 190 * av,
                child: const CirculosEnGrid(),
              ),
            ),
            Positioned(
              right: -300,
              top: 1100,
              child: SizedBox(
                width: 600 * av,
                height: 600 * av,
                child: Circumference3(
                  widthC: 700 * av,
                  heightC: 645.04 * av,
                  opacity: 225,
                ),
              ),
            ),
            Positioned(
              left: -200,
              top: -250,
              child: SizedBox(
                width: 800 * av,
                height: 800 * av,
                child: Circumference(
                  opacity: 100,
                ),
              ),
            ),
            Positioned(
              right: 90,
              top: 190,
              child: SizedBox(
                width: 200 * av,
                height: 200 * av,
                child: const CirculosEnGrid(),
              ),
            ),
            Positioned(
              left: -200,
              top: -270,
              child: SizedBox(
                width: 600 * av,
                height: 600,
                child: Circumference3(
                  widthC: 700 * av,
                  heightC: 646 * av,
                  opacity: 225,
                ),
              ),
            ),
            Positioned(
              right: -200,
              bottom: -250,
              child: SizedBox(
                width: 800 * av,
                height: 800 * av,
                child: Circumference(
                  opacity: 100,
                ),
              ),
            ),
            Positioned(
              left: 90,
              bottom: 4,
              child: SizedBox(
                width: 200 * av,
                height: 200 * av,
                child: const CirculosEnGrid(),
              ),
            ),
            Positioned(
              right: -200,
              bottom: -270,
              child: SizedBox(
                width: 600 * av,
                height: 600 * av,
                child: Circumference3(
                  widthC: 700 * av,
                  heightC: 646 * av,
                  opacity: 225,
                ),
              ),
            ),
            Positioned(
              left: av == 1.0
                  ? 60
                  : av == .65
                      ? 30
                      : 10,
              top: av == 1.0
                  ? 220
                  : av == .65
                      ? 350
                      : 330,
              child: SizedBox(
                width: 900 * av,
                height: 180 * av,
                child: Text(
                  "BOLETO VIP. \n${NumberFormat.currency(locale: 'es_MX', symbol: '\$').format(22000)} \n hasta 12 meses sin intereses.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (39 / fontSize),
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: av == 1.0
                  ? 30
                  : av == .65
                      ? 30
                      : 10,
              top: av == 1.0
                  ? 120
                  : av == .65
                      ? 50
                      : 45,
              child: SizedBox(
                width: 900 * av,
                height: 150 * av,
                child: Text(
                  'VENTA DE BOLETOS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (69 / fontSize),
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: av == 1.0
                  ? 50
                  : av == .65
                      ? 35
                      : 15,
              top: av == 1
                  ? 400
                  : av == .65
                      ? 490
                      : 420,
              child: SizedBox(
                width: 800 * av,
                height: 400 * av,
                child: Text(
                  paragraph,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: width /
                        (av == 1.0
                            ? 70
                            : av == .65
                                ? 45
                                : 35),
                  ),
                ),
              ),
            ),
            Positioned(
              right: av == 1.0
                  ? 10
                  : av == .65
                      ? -40
                      : 39,
              top: av == .45
                  ? 90
                  : av == .65
                      ? 110
                      : 290,
              child: Container(
                width: width /
                    (av == 1.0
                        ? 2.5
                        : av == .65
                            ? 1.5
                            : 1.3),
                height: 500 * av,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(55, 83, 158, 228),
                    width: 10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: width /
                  (av == 1.0
                      ? 2.1
                      : av == .65
                          ? 3.5
                          : -55),
              top: av == 1.0
                  ? 420
                  : av == .65
                      ? 190
                      : 150,
              child: SizedBox(
                width: 900 * av,
                height: 220 * av,
                child: Text(
                  '26/27\nOCTUBRE\nHORARIO\n10:00 - 19:00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (35 / fontSize),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Positioned(
              left: av == 1.0
                  ? 80
                  : av == .65
                      ? 80
                      : 100,
              bottom: av == 1.0
                  ? 10
                  : av == .65
                      ? 50
                      : 50,
              child: const SizedBox(
                child: ConstantBounceButton(),
              ),
            ),
            Positioned(
              left: width /
                  (av == 1.0
                      ? 12
                      : av == .65
                          ? 20
                          : -10),
              top: 0,
              child: SizedBox(
                width: width /
                    (av == 1.0
                        ? 1.11
                        : av == .65
                            ? 1.11
                            : .9),
                height: 90 * av,
                child: BarNavi(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
