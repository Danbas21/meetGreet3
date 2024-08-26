import 'package:flutter/material.dart';
import 'package:flutter_app/utils/grid_gallery/staggered.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;

  const HoverContainer({super.key, required this.child});

  @override
  HoverContainerState createState() => HoverContainerState();
}

class HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const StaggeredPage()),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutBack,
        transform:
            _isHovered ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: widget.child,
      ),
    );
  }
}
