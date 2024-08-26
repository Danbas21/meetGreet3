import 'package:flutter/material.dart';

import 'package:flutter_app/main.dart';

import 'package:flutter_app/pages/invite_page.dart';
import 'package:flutter_app/pages/schedule_page.dart';
import 'package:flutter_app/pages/whatis_page.dart';
import 'package:flutter_app/utils/screen_utils.dart';

class BarNavi extends StatelessWidget implements PreferredSizeWidget {
  const BarNavi({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double av = ResponsiveUtil.getMultiplier(context);

    return AppBar(
      backgroundColor: width > 1200
          ? const Color.fromARGB(255, 255, 252, 252)
          : const Color.fromARGB(255, 231, 92, 74),
      elevation: 2,
      scrolledUnderElevation: 2,
      surfaceTintColor: Colors.white,
      leading: width > 1200
          ? null
          : Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  height: 250,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(
                      Icons.menu_sharp,
                      size: 30,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
      actions: width > 1200
          ? <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ResponsiveZoomableWebPage()),
                  );
                },
                child: Text(
                  'HOME',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 12, 12, 12),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WhatIsPage(),
                    ),
                  );
                },
                child: Text(
                  '¿QUÉ ES?',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 12, 12, 12),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListInvites(),
                    ),
                  );
                },
                child: Text(
                  'INVITADOS',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 12, 12, 12),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SchedulePage(),
                    ),
                  );
                },
                child: Text(
                  'HORARIOS',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 12, 12, 12),
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
            ]
          : null,
    );
  }
}
