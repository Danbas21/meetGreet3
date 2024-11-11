import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;

class GalleryGrid extends StatefulWidget {
  const GalleryGrid({super.key});

  @override
  State<GalleryGrid> createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  // Cargar las imágenes desde Firebase Storage
  Future<void> loadImages() async {
    try {
      final storageRef = storage.ref().child('meetandgreet/julio');
      final ListResult result = await storageRef.listAll();

      final urls = await Future.wait(
        result.items.map((Reference ref) => ref.getDownloadURL()),
      );

      setState(() {
        imageUrls = urls.cast<String>();
      });
    } catch (e) {
      print('Error al cargar imágenes: $e');
    }
  }

  void downloadImage(String imageUrl) {
    final anchor = html.AnchorElement(href: imageUrl)
      ..download = imageUrl.split('/').last // Nombre del archivo
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarNavi(),
      body: imageUrls.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: imageUrls[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                          onPressed: () => downloadImage(imageUrls[index]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
