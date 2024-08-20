import 'package:flutter/material.dart';
import 'package:flutter_app/pages/contac_page.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double av = ResponsiveUtil.getMultiplier(context);
    return Container(
      width: width,
      height: 20,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 121, 152, 184),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/rectangle_18.png',
            width: width /
                (av == 1.0
                    ? 5
                    : av == .65
                        ? 5
                        : 5),
          ),
          const SizedBox(height: 5),
          // SizedBox(
          //   width: width /
          //       (av == 1.0
          //           ? 1.7
          //           : av == .65
          //               ? 2
          //               : 5),
          //   height: height / 7,
          //   child: Text(
          //     'Dirección\nBoulevard Interlomas 5 Centro Urbano San Fernando. La herradura 52786 Huixquilucan. Estado de México.',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: width /
          //             (av == 1.0
          //                 ? 60
          //                 : av == .65
          //                     ? 40
          //                     : 52)),
          //   ),
          // ),
          const SocialIconButton(
            icon: FontAwesomeIcons.facebookF,
            url: 'https://facebook.com',
          ),
          const SocialIconButton(
            icon: FontAwesomeIcons.instagram,
            url: 'https://www.instagram.com/meetandgreet_experience_mexico/',
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactFormPage(),
                ),
              );
            },
            child: Text(
              'CONTACTO',
              style: TextStyle(
                color: Colors.white,
                fontSize: width /
                    (av == 1.0
                        ? 90
                        : av == .65
                            ? 70
                            : 35),
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIconButton({super.key, required this.icon, required this.url});

  @override
  _SocialIconButtonState createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double av = ResponsiveUtil.getMultiplier(context);
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          // Aquí puedes manejar la lógica para abrir la URL
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? const Color(0xFF343A40) : Colors.white,
            size: width /
                (av == 1.0
                    ? 40
                    : av == .65
                        ? 30
                        : 20),
          ),
        ),
      ),
    );
  }
}
