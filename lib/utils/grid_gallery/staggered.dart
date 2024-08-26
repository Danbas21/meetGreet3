import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/grid_gallery/common.dart';
import 'package:flutter_app/utils/grid_gallery/staggered_grid2.dart';
import 'package:flutter_app/utils/grid_gallery/staggered_grid_tile.dart';
import 'package:flutter_app/utils/utils_list.dart';

class StaggeredPage extends StatelessWidget {
  const StaggeredPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Meet and Greet',
      child: ListView.builder(
        itemCount: (imageGallery.length / 5)
            .ceil(), // Dividimos en grupos de 5 imágenes
        itemBuilder: (context, groupIndex) {
          final startIndex = groupIndex * 5;
          final endIndex = (startIndex + 5 < imageGallery.length)
              ? startIndex + 5
              : imageGallery.length;
          final groupImages = imageGallery.sublist(startIndex, endIndex);

          return StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              if (groupImages.isNotEmpty)
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Image.asset(
                        groupImages[0],
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        alignment: Alignment.bottomLeft,
                      );
                    },
                  ),
                ),
              if (groupImages.length > 1)
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Image.asset(
                        groupImages[1],
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
              if (groupImages.length > 2)
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: FittedBox(
                    clipBehavior: Clip.hardEdge,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Image.asset(
                          groupImages[2],
                          fit: BoxFit.cover,
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          alignment: Alignment.center,
                        );
                      },
                    ),
                  ),
                ),
              if (groupImages.length > 3)
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Image.asset(
                        groupImages[3],
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
              if (groupImages.length > 4)
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Image.asset(
                        groupImages[4],
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
