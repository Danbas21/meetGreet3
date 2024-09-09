import 'package:flutter/material.dart';
import 'package:flutter_app/utils/animation_card.dart';

class ImageGrid extends StatefulWidget {
  final List<String> images;
  final List<String> descrip;

  const ImageGrid({super.key, required this.images, required this.descrip});
  @override
  ImageGridState createState() => ImageGridState();
}

class ImageGridState extends State<ImageGrid> {
  // Controlador de desplazamiento
  final ScrollController _scrollController = ScrollController();

  bool isUpPressed = false;
  bool isDownPressed = false;

  void _scrollUp() {
    setState(() {
      isUpPressed = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          isUpPressed = false;
        });
      });
    });

    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollDown() {
    setState(() {
      isDownPressed = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          isDownPressed = false;
        });
      });
    });

    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 50, // Ancho del botón
              height: 50, // Altura del botón
              decoration: BoxDecoration(
                color: isUpPressed
                    ? const Color.fromARGB(255, 241, 31, 3)
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_upward,
                  color: isUpPressed
                      ? Colors.white
                      : const Color.fromARGB(255, 241, 31, 3),
                ),
                onPressed: _scrollUp,
                alignment: Alignment.center, // Alinea el ícono al centro
              ),
            ),
            Container(
              width: 50, // Ancho del botón
              height: 50, // Altura del botón
              decoration: BoxDecoration(
                color: isDownPressed
                    ? const Color.fromARGB(255, 241, 31, 3)
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_downward,
                  color: isDownPressed
                      ? Colors.white
                      : const Color.fromARGB(255, 241, 31, 3),
                ),
                onPressed: _scrollDown,
                alignment: Alignment.center, // Alinea el ícono al centro
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return RotatableImageCard(
                frontImage: widget.images[index % widget.images.length],
                description: widget.descrip[index % widget.descrip.length],
              );
            },
          ),
        ),
      ],
    );
  }
}
