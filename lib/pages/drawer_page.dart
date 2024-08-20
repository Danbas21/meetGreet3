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
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(20, 20),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));
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
          transformHitTests: true,
          child: SizedBox(
            width: width / 2,
            height: height / 1,
            child: Drawer(
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
                          color: const Color.fromARGB(255, 255, 255, 255),
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
                  ListTile(
                    title: Text(
                      'HOME',
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
                          builder: (context) => ResponsiveZoomableWebPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      '¿QUÉ ES?',
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
                          builder: (context) => const WhatIsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'INVITADOS',
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
                          builder: (context) => const ListInvites(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'HORARIOS',
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
                          builder: (context) => SchedulePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
