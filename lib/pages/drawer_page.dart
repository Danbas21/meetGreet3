import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/invite_page.dart';
import 'package:flutter_app/pages/schedule_page.dart';
import 'package:flutter_app/pages/whatis_page.dart';
import 'package:flutter_app/utils/screen_utils.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin:
          const Offset(3.0, 0.0), // Comienza fuera de la pantalla a la derecha
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double av = ResponsiveUtil.getMultiplier(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: width / 2,
              height: height,
              child: Drawer(
                elevation: 2,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: height / 10,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 231, 92, 74),
                        ),
                        child: Text(
                          'Menú',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width /
                                (av == 1.0
                                    ? 90
                                    : av == .65
                                        ? 40
                                        : 35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    _buildListTile(
                      context,
                      'HOME',
                      const ResponsiveZoomableWebPage(),
                    ),
                    _buildListTile(
                      context,
                      '¿QUÉ ES?',
                      const WhatIsPage(),
                    ),
                    _buildListTile(
                      context,
                      'INVITADOS',
                      const ListInvites(),
                    ),
                    _buildListTile(
                      context,
                      'HORARIOS',
                      const SchedulePage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildListTile(BuildContext context, String title, Widget page) {
    final double width = MediaQuery.of(context).size.width;
    final double av = ResponsiveUtil.getMultiplier(context);
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black87,
          fontSize: width /
              (av == 1.0
                  ? 90
                  : av == .65
                      ? 40
                      : 35),
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
    );
  }
}
