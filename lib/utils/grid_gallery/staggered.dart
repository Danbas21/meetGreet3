import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/utils_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryGridStaggered extends StatelessWidget {
  const GalleryGridStaggered({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BarNavi(),
      drawer: width < 1200 ? const AppDrawer() : null,
      body: Column(
        children: [
          Expanded(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: List.generate(
                imageGallery.length,
                (index) => _buildGridTile(context, index, imageGallery[index]),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: height / 5.5,
            child: const Footer(),
          ),
        ],
      ),
    );
  }

  Widget _buildGridTile(BuildContext context, int index, String imageUrl) {
    final cellCounts = [
      [2, 2],
      [2, 1],
      [1, 1],
      [1, 1],
      [4, 3],
    ];

    return StaggeredGridTile.count(
      crossAxisCellCount: cellCounts[index % 5][0],
      mainAxisCellCount: cellCounts[index % 5][1],
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            alignment: index % 5 == 4 ? Alignment.topCenter : Alignment.center,
            placeholder: (context, url) => Container(
              color: Colors.grey[200],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) {
              print('Error loading image $url: $error');
              return Container(
                color: Colors.grey[300],
                child:
                    const Center(child: Icon(Icons.error, color: Colors.red)),
              );
            },
          ),
        ),
      ),
    );
  }
}

// La de URLs de imágenes en Firebase
List<String> imageGallery = [
  'https://firebasestorage.googleapis.com/v0/b/mancaveautographs-5397e.appspot.com/o/Gallery%2Fmeet1.jpg?alt=media&token=dd059922-9a9a-4f57-8b0c-bdf829a6a004',
  'https://firebasestorage.googleapis.com/v0/b/mancaveautographs-5397e.appspot.com/o/Gallery%2Fmeet2.jpg?alt=media&token=dd059922-9a9a-4f57-8b0c-bdf829a6a004',
  // Agrega aquí las otras 73 URLs
  // ...
];
