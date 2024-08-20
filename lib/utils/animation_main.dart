import 'package:flutter/material.dart';

class AnimationMain extends StatefulWidget {
  final String img;
  final double wiseAnimation;
  const AnimationMain({
    super.key,
    required this.img,
    required this.wiseAnimation,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<AnimationMain>
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
      end: MediaQuery.of(context).size.height / 4,
    ).animate(
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
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
                top: _positionAnimation.value,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 2,
                        color: const Color.fromARGB(255, 196, 228, 243)
                            .withOpacity(0.5),
                        blurRadius: 250,
                        offset: const Offset(26, 26),
                      ),
                    ],
                  ),
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Image.asset(
                      widget.img,
                      fit: BoxFit.fill,
                    ),
                  ),
                ));
          },
        ),
      ],
    );
    // floatingActionButton:
    // FloatingActionButton(
    //   onPressed: () {
    //     if (_controller.status == AnimationStatus.completed) {
    //       _controller.reverse();
    //     } else {
    //       _controller.forward();
    //     }
    //   },
    //   child: const Icon(Icons.play_arrow),
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
