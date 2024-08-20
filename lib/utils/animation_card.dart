import 'package:flutter/material.dart';

class RotatableImageCard extends StatefulWidget {
  final String frontImage;
  final String description;

  RotatableImageCard({required this.frontImage, required this.description});

  @override
  _RotatableImageCardState createState() => _RotatableImageCardState();
}

class _RotatableImageCardState extends State<RotatableImageCard>
    with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    setState(() {
      _isFlipped = !_isFlipped;
      if (_isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: GestureDetector(
            onTap: _toggleCard,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final angle = _animation.value * 3.14;
                return Transform(
                  transform: Matrix4.rotationY(angle),
                  alignment: Alignment.center,
                  child: angle >= 1.57
                      ? Transform(
                          transform: Matrix4.rotationY(3.14),
                          alignment: Alignment.center,
                          child: _buildBackSide(),
                        )
                      : _buildFrontSide(),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final angle = _animation.value * 3.14;
              return Transform(
                transform: Matrix4.rotationY(angle),
                alignment: Alignment.center,
                child: angle >= 1.57
                    ? Transform(
                        transform: Matrix4.rotationY(3.14),
                        alignment: Alignment.center,
                        child: _buildBackSide(),
                      )
                    : _buildFrontSide(),
              );
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.add_circle,
                  color: Color.fromARGB(255, 76, 84, 199), size: 20),
              onPressed: () => _showPopup(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontSide() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          widget.frontImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBackSide() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          widget.description,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
