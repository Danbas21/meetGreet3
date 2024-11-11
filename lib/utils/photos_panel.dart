import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/lading_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/grid_gallery/staggered%20copy.dart';
import 'package:flutter_app/utils/grid_gallery/staggered.dart';
import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';

class PhotosPanel extends StatefulWidget {
  const PhotosPanel({super.key});

  @override
  State<PhotosPanel> createState() => _PhotosPanelState();
}

class _PhotosPanelState extends State<PhotosPanel> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> panel = [
      ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          constraints: const BoxConstraints(
            maxWidth: 900,
            maxHeight: 700,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/box/box9.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    // Aquí agregamos la navegación correcta
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GalleryGrid(),
                      ),
                    );
                  },
                  child: Text("Descarga tu foto"),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          constraints: const BoxConstraints(
            maxWidth: 900,
            maxHeight: 700,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/fut/fut4.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GalleryGrid2(),
                      ),
                    );
                  },
                  child: Text("Descarga tu foto"),
                ),
              )
            ],
          ),
        ),
      )
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double multiplier = ResponsiveUtil.getMultiplier(context);

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(children: [
          const Positioned(
            left: -200,
            bottom: 1000,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            right: 90,
            bottom: 1000,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            left: -200,
            bottom: 1100,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          const Positioned(
            right: -250,
            top: 1000,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            left: 90,
            top: 950,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            right: -300,
            top: 1100,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          const Positioned(
            left: -200,
            top: -250,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            right: 90,
            top: 290,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            left: -200,
            top: -270,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          const Positioned(
            right: -200,
            bottom: -250,
            child: SizedBox(
              width: 800,
              height: 800,
              child: Circumference(
                opacity: 100,
              ),
            ),
          ),
          const Positioned(
            left: 90,
            bottom: 290,
            child: SizedBox(
              width: 145,
              height: 80,
              child: CirculosEnGrid(),
            ),
          ),
          const Positioned(
            right: -200,
            bottom: -270,
            child: SizedBox(
              width: 600,
              height: 600,
              child: Circumference3(
                widthC: 700,
                heightC: 645.04,
                opacity: 225,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            child: SizedBox(
              width: width,
              height: height,
              child: ListView.builder(
                itemCount: panel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [panel[index]],
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 50 * multiplier,
            top: 0 * multiplier,
            child: SizedBox(
              width: 900 * multiplier,
              height: 70 * multiplier,
              child: const BarNavi(),
            ),
          ),
        ]),
      ),
    );
  }
}
