import 'package:flutter/material.dart';

class AnimationMainText extends StatefulWidget {
  final String img;
  final double wiseAnimation;
  final double fontSized;
  final FontWeight fontWeight;
  final double letterSpacing;

  const AnimationMainText({
    super.key,
    required this.img,
    required this.wiseAnimation,
    required this.fontSized,
    required this.fontWeight,
    required this.letterSpacing,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<AnimationMainText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.10,
      end: 1.0,
    ).animate(_controller);

    _positionAnimation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _positionAnimation = Tween<double>(
            begin: widget.wiseAnimation,
            end: 0 //MediaQuery.of(context).size.height / 4,
            )
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final double fontSize = widget.fontSized;
    final FontWeight fontWeight = widget.fontWeight;
    final double letterSpacing = widget.letterSpacing;

    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
              top: 0,
              right: 0,
              left: _positionAnimation.value,
              child: SizedBox(
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Text(
                    widget.img,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      letterSpacing: letterSpacing,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
