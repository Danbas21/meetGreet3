import 'package:flutter/material.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/utils_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryGridStaggered extends StatelessWidget {
  const GalleryGridStaggered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarNavi(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: (imageGallery.length / 5).ceil(),
                itemBuilder: (context, groupIndex) {
                  final startIndex = groupIndex * 5;
                  final endIndex =
                      (startIndex + 5).clamp(0, imageGallery.length);
                  final groupImages =
                      imageGallery.sublist(startIndex, endIndex);
                  return StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        for (int i = 0; i < groupImages.length; i++)
                          _buildGridTile(i, groupImages[i]),
                      ]);
                }),
          )
        ],
      ),
    );
  }
}

Widget _buildGridTile(int index, String imagePath) {
  final cellCounts = [
    [2, 2],
    [2, 1],
    [1, 1],
    [1, 1],
    [4, 3],
  ];

  return StaggeredGridTile.count(
    crossAxisCellCount: cellCounts[index][0],
    mainAxisCellCount: cellCounts[index][1],
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/load.gif'),
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          alignment: index == 4 ? Alignment.topCenter : Alignment.center,
        ),
      ),
    ),
  );
}
