import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class GalleryGridStaggered extends StatefulWidget {
  const GalleryGridStaggered({super.key});

  @override
  State<GalleryGridStaggered> createState() => _GalleryGridStaggeredState();
}

class _GalleryGridStaggeredState extends State<GalleryGridStaggered> {
  final storage = FirebaseStorage.instance;

  Future<String> getImageUrl() async {
    try {
      print('Iniciando getImageUrl');
      final ref = storage.ref().child('Gallery/meet2.JPG');
      print('Referencia creada: ${ref.fullPath}');
      final url = await ref.getDownloadURL();
      print('URL obtenida: $url');

      // Intenta hacer una solicitud GET a la URL

      final response = await http.get(Uri.parse(url));
      print('Respuesta HTTP: ${response.statusCode}');
      if (response.statusCode != 200) {
        throw Exception('HTTP error ${response.statusCode}');
      }

      return url;
    } catch (e) {
      print('Error detallado en getImageUrl: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarNavi(),
      drawer:
          MediaQuery.of(context).size.width < 1200 ? const AppDrawer() : null,
      body: Column(
        children: [
          FutureBuilder<String>(
            future: getImageUrl(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Center(
                    child: Text('Error loading image: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) {
                      print('Error loading image: $error');
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          Text('Error: $error', textAlign: TextAlign.center),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return const Text('No image URL available');
              }
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            child: const Footer(),
          ),
        ],
      ),
    );
  }
}
//   Widget _buildGridTile(
//     BuildContext context,
//     int index,
//   ) {
//     final cellCounts = [
//       [2, 2],
//       [2, 1],
//       [1, 1],
//       [1, 1],
//       [4, 3],
//     ];

//     return StaggeredGridTile.count(
//       crossAxisCellCount: 2,
//       mainAxisCellCount: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Image.network(imageUrl),
//       ),
//     );
//   }
// }

// // La de URLs de imágenes en Firebase
// List<String> imageGallery = [
//   'https://firebasestorage.googleapis.com/v0/b/mancaveautographs-5397e.appspot.com/o/Gallery%2Fmeet1.jpg?alt=media&token=dd059922-9a9a-4f57-8b0c-bdf829a6a004',
//   'https://firebasestorage.googleapis.com/v0/b/mancaveautographs-5397e.appspot.com/o/Gallery%2Fmeet2.jpg?alt=media&token=dd059922-9a9a-4f57-8b0c-bdf829a6a004',
//   // Agrega aquí las otras 73 URLs
//   // ...
// ];