import 'package:flutter/material.dart';

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.grab,
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
