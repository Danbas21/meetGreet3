import 'package:flutter/material.dart';
import 'package:flutter_app/utils/grid_gallery/common.dart';
import 'package:flutter_app/utils/grid_gallery/staggered_grid2.dart';
import 'package:flutter_app/utils/grid_gallery/staggered_grid_tile.dart';
import 'package:flutter_app/utils/utils_list.dart';
import 'package:provider/provider.dart';

class StaggeredPage extends StatefulWidget {
  const StaggeredPage({Key? key}) : super(key: key);

  @override
  State<StaggeredPage> createState() => _StaggeredPageState();
}

class _StaggeredPageState extends State<StaggeredPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Meet and Greet',
      child: Consumer<DataState>(
        builder: (context, img, child) => ListView.builder(
          itemCount: (img.images.length / 5).ceil(),
          itemBuilder: (context, groupIndex) {
            final startIndex = groupIndex * 5;
            final endIndex = (startIndex + 5).clamp(0, img.images.length);
            final groupImages = img.images.sublist(startIndex, endIndex);

            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  for (int i = 0; i < groupImages.length; i++)
                    _buildGridTile(i, groupImages[i]),
                ],
              ),
            );
          },
        ),
      ),
    );
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/load.gif'),
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          alignment: index == 4 ? Alignment.topCenter : Alignment.center,
        ),
      ),
    );
  }
}

class DataState with ChangeNotifier {
  bool loading = false;
  List<String> images = imageGallery;

  DataState() {
    loadFirstPage();
  }

  void loadFirstPage() async {
    setLoading(true);
    try {
      // Simula una operación asincrónica
      await Future.delayed(Duration(seconds: 2));
      images = List.from(imageGallery); // Simula la carga de imágenes
    } catch (e) {
      print('Error: $e');
    } finally {
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    if (loading != value) {
      loading = value;
      notifyListeners();
    }
  }
}
