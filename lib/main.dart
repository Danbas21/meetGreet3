import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/pages/footer_page.dart';
import 'package:flutter_app/pages/lading_page.dart';
import 'package:flutter_app/pages/lading_page_2.dart';
import 'package:flutter_app/pages/lading_page_3.dart';
import 'package:flutter_app/utils/animation_main.dart';
import 'package:flutter_app/utils/animation_text.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/hover_animation.dart';
import 'package:flutter_app/utils/time_regre.dart';
import 'package:flutter_app/utils/utils_list.dart';
import 'package:flutter_app/utils/widget_button.dart';
import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/invite_grid.dart';
import 'package:flutter_app/utils/list_images.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meet & Greet Experience',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ResponsiveZoomableWebPage(),
    );
  }
}

enum Section { one, two, three }

class ResponsiveZoomableWebPage extends StatefulWidget {
  static const double wideBreakpoint = 1200;
  static const double mediumBreakpoint = 600;

  final int numberOfSections;

  const ResponsiveZoomableWebPage({super.key, this.numberOfSections = 1});

  @override
  State<ResponsiveZoomableWebPage> createState() =>
      _ResponsiveZoomableWebPageState();
}

class _ResponsiveZoomableWebPageState extends State<ResponsiveZoomableWebPage> {
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const BarNavi(),
      drawer:
          width < ResponsiveZoomableWebPage.wideBreakpoint ? AppDrawer() : null,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isPortrait = orientation == Orientation.portrait;
              return Column(
                children: [
                  // Indicador de orientación

                  // Contenido principal
                  Expanded(
                    child: InteractiveViewer(
                      clipBehavior: Clip.antiAlias,
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 1.0,
                      maxScale: 5,
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: constraints.maxWidth),
                          child: IntrinsicHeight(
                            child: _buildResponsiveContent(
                                constraints.maxWidth, isPortrait, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildResponsiveContent(double screenWidth, bool isPortrait, context) {
    // Ajustamos los breakpoints basados en la orientación
    final adjustedWideBreakpoint = isPortrait
        ? ResponsiveZoomableWebPage.wideBreakpoint
        : ResponsiveZoomableWebPage.wideBreakpoint * 0.75;
    final adjustedMediumBreakpoint = isPortrait
        ? ResponsiveZoomableWebPage.mediumBreakpoint
        : ResponsiveZoomableWebPage.mediumBreakpoint * 0.75;

    if (screenWidth > adjustedWideBreakpoint) {
      return _buildWideLayout(context);
    } else if (screenWidth > adjustedMediumBreakpoint) {
      return _buildMediumLayout(context);
    } else {
      return _buildNarrowLayout(context);
    }
  }

  Widget _buildWideLayout(context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final List<String> imgList = [
      ImagesCarge.ban1,
      ImagesCarge.ban2,
      ImagesCarge.ban3,
      ImagesCarge.ban4,
      ImagesCarge.ban5,
    ];
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: width / 2,
              height: height / 1.2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(26, 163, 224, 217),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: -100,
                    top: -100,
                    child: SizedBox(
                      child: Circumference(
                        opacity: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 0,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/images/rectangle_16.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: width / 8,
                    child: SizedBox(
                      width: width / 2,
                      height: 200,
                      child: AnimationMainText(
                          img: "EXPO REFORMA,CDMX 26 - 27 OCTUBRE 2024",
                          wiseAnimation: 4,
                          fontSized: width / 60,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1),
                    ),
                  ),
                  Positioned(
                    top: width / 7.5,
                    left: 10,
                    child: SizedBox(
                      width: width / 1.5,
                      height: height / 10,
                      child: AnimationMainText(
                          img: "MEET & GREET",
                          wiseAnimation: 400,
                          fontSized: width / 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0),
                    ),
                  ),
                  Positioned(
                    top: width / 6,
                    left: 10,
                    child: SizedBox(
                      width: width / 1.5,
                      height: height / 10,
                      child: AnimationMainText(
                          img: "EXPERIENCE",
                          wiseAnimation: -300,
                          fontSized: width / 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0),
                    ),
                  ),
                  Positioned(
                    top: width / 5,
                    left: 10,
                    child: SizedBox(
                      width: width / 1.5,
                      height: height / 10,
                      child: AnimationMainText(
                          img: "2024",
                          wiseAnimation: 400,
                          fontSized: width / 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0),
                    ),
                  ),
                  Positioned(
                    top: width / 3,
                    right: 10,
                    child: SizedBox(width: 350, child: ConstantBounceButton()),
                  ),
                  Positioned(
                    top: width / 4.5,
                    left: 10,
                    child: SizedBox(
                        width: width / 4,
                        height: height / 2,
                        child: Image.asset('assets/images/losniños.png')),
                  ),
                ],
              ),
            ),
            Container(
              width: width / 2,
              height: height / 1.2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(26, 163, 224, 217),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  clipBehavior: Clip.antiAlias,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(seconds: 5),
                  viewportFraction: 1.0,
                ),
                items: imgList
                    .map((item) => Image.asset(
                          item,
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
        HomePage(),
        LandingPage2(),
        LadingPage3(),
        Container(
          width: width,
          height: height / 3.5,
          child: Footer(),
        ),
      ],
    );
  }

  Widget _buildMediumLayout(context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final List<String> imgList = [
      ImagesCarge.ban1,
      ImagesCarge.ban2,
      ImagesCarge.ban3,
      ImagesCarge.ban4,
      ImagesCarge.ban5,
    ];

    return Column(
      children: [
        Container(
          width: width,
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 252, 251),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0,
                top: -100,
                child: SizedBox(
                  child: Circumference(
                    opacity: 100,
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 10,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    'assets/images/rectangle_16.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: width / 4,
                child: SizedBox(
                  width: width,
                  height: 200,
                  child: AnimationMainText(
                      img: "EXPO REFORMA,CDMX 26 - 27 OCTUBRE 2024",
                      wiseAnimation: 4,
                      fontSized: width / 30,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
              ),
              Positioned(
                top: width / 3.8,
                left: 10,
                child: SizedBox(
                  width: width,
                  height: 150,
                  child: AnimationMainText(
                      img: "MEET & GREET",
                      wiseAnimation: 400,
                      fontSized: width / 7,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
              Positioned(
                top: width / 2.3,
                left: 10,
                child: SizedBox(
                  width: width,
                  height: 150,
                  child: AnimationMainText(
                      img: "EXPERIENCE",
                      wiseAnimation: -300,
                      fontSized: width / 7,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
              Positioned(
                top: width / 1.6,
                left: 10,
                child: SizedBox(
                  width: width,
                  height: 150,
                  child: AnimationMainText(
                      img: "2024",
                      wiseAnimation: 400,
                      fontSized: width / 7,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
              const Positioned(
                bottom: 10,
                right: 10,
                child: SizedBox(
                    width: 200, height: 70, child: ConstantBounceButton()),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Image.asset('assets/images/losniños.png')),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height / 3,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 4),
              viewportFraction: 1.0,
            ),
            items: imgList
                .map(
                  (item) => Image.asset(
                    item,
                    fit: BoxFit.fill,
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          width: width,
          height: height / 3.5,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Center(
            child: CountdownPage(),
          ),
        ),
        Container(
          width: width,
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: -150,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_15.png",
                    wiseAnimation: 600,
                  ),
                ),
              ),
              Positioned(
                left: width / 3.8,
                top: -100,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_7.png",
                    wiseAnimation: -600,
                  ),
                ),
              ),
              Positioned(
                right: width / 3.7,
                top: -150,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_9.png",
                    wiseAnimation: 600,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: -90,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_11.png",
                    wiseAnimation: -600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Image.asset(
            'assets/images/maps.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: width,
          height: height / 2.2,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: -150,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangle.png",
                          wiseAnimation: 600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: width / 3.8,
                      top: -130,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangle_13.png",
                          wiseAnimation: -600,
                        ),
                      ),
                    ),
                    Positioned(
                      right: width / 3.7,
                      top: -150,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangle_10.png",
                          wiseAnimation: 600,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: -130,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangl.png",
                          wiseAnimation: -600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height * 3.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Ídolos del Boxeo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width / 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listBox,
                      descrip: ListImages.listBoxPots),
                ),
                Text(
                  "Ídolos del Fútbol",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listFut,
                      descrip: ListImages.listFutPots),
                ),
                Text(
                  "Ídolos del Ring",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listLuch,
                      descrip: ListImages.listLuchPost),
                ),
                Text(
                  " Ídolos NFL",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listNlf,
                      descrip: ListImages.listPostNlf),
                ),
                Text(
                  "Ídolos MMA y UFC",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                    images: ListImages.listUFC,
                    descrip: ListImages.listUFC,
                  ),
                ),
                Text(
                  "La mejor raquetbolista del mundo",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listRacket,
                      descrip: ListImages.listPotsRacket),
                ),
                Text(
                  "Ídolos NBA",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listNba, descrip: ListImages.listNba),
                ),
                Text(
                  "Única mujer mexicana en WWE",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listWomanWwe,
                      descrip: ListImages.listWomanWwe),
                ),
                Text(
                  "Invitado especial de la WBC :",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listBBX, descrip: ListImages.listBBX),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
          ),
          width: width,
          height: height / 1.3,
          child: Stack(children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: width,
                height: height / 2,
                child: HoverContainer(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/rectangle_6.png',
                        width: width,
                        height: height / 4,
                      ),
                      Text(
                        'Próximos Eventos',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width / 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: width,
                height: height / 2,
                child: HoverContainer(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/rectangle_20.png',
                        width: width,
                        height: height / 3.5,
                      ),
                      Text(
                        'Meet & Greet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width / 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          width: width,
          height: height / 6.5,
          child: Footer(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final List<String> imgList = [
      ImagesCarge.ban1,
      ImagesCarge.ban2,
      ImagesCarge.ban3,
      ImagesCarge.ban4,
      ImagesCarge.ban5,
    ];
    return Column(
      children: [
        Container(
          width: width,
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 245, 251, 250),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0,
                top: -100,
                child: SizedBox(
                  child: Circumference(
                    opacity: 100,
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 8,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    'assets/images/rectangle_16.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: width / 4.5,
                child: SizedBox(
                  width: width,
                  height: 200,
                  child: AnimationMainText(
                      img: "EXPO REFORMA,CDMX 26 - 27 OCTUBRE 2024",
                      wiseAnimation: 4,
                      fontSized: width / 40,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
              ),
              Positioned(
                top: width / 3.8,
                left: 10,
                child: SizedBox(
                  width: width,
                  height: 150,
                  child: AnimationMainText(
                      img: "MEET & GREET",
                      wiseAnimation: 400,
                      fontSized: width / 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
              Positioned(
                top: width / 2.8,
                left: 10,
                child: SizedBox(
                  width: width,
                  height: 150,
                  child: AnimationMainText(
                      img: "EXPERIENCE",
                      wiseAnimation: -300,
                      fontSized: width / 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
              Positioned(
                top: width / 2.2,
                left: 10,
                child: SizedBox(
                  width: width,
                  height: 150,
                  child: AnimationMainText(
                      img: "2024",
                      wiseAnimation: 400,
                      fontSized: width / 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
              const Positioned(
                bottom: 15,
                right: 10,
                child: SizedBox(
                    width: 170, height: 60, child: ConstantBounceButton()),
              ),
              Positioned(
                bottom: 10,
                left: 15,
                child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Image.asset('assets/images/losniños.png')),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height / 3,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 4),
              viewportFraction: 1.0,
            ),
            items: imgList
                .map(
                  (item) => Image.asset(
                    item,
                    fit: BoxFit.fill,
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          width: width,
          height: height / 3.5,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Center(
            child: CountdownPage(),
          ),
        ),
        Container(
          width: width,
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: -150,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_15.png",
                    wiseAnimation: 600,
                  ),
                ),
              ),
              Positioned(
                left: width / 3.8,
                top: -100,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_7.png",
                    wiseAnimation: -600,
                  ),
                ),
              ),
              Positioned(
                right: width / 3.7,
                top: -150,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_9.png",
                    wiseAnimation: 600,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: -90,
                child: SizedBox(
                  width: width / 4.5,
                  height: height,
                  child: const AnimationMain(
                    img: "assets/images/rectangle_11.png",
                    wiseAnimation: -600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Image.asset(
            'assets/images/maps.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: width,
          height: height / 2.2,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: -150,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangle.png",
                          wiseAnimation: 600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: width / 3.8,
                      top: -130,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangle_13.png",
                          wiseAnimation: -600,
                        ),
                      ),
                    ),
                    Positioned(
                      right: width / 3.7,
                      top: -150,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangle_10.png",
                          wiseAnimation: 600,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: -130,
                      child: SizedBox(
                        width: width / 4.5,
                        height: height,
                        child: const AnimationMain(
                          img: "assets/images/rectangl.png",
                          wiseAnimation: -600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height * 3.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Ídolos del Boxeo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width / 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listBox,
                      descrip: ListImages.listBoxPots),
                ),
                Text(
                  "Ídolos del Fútbol",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listFut,
                      descrip: ListImages.listFutPots),
                ),
                Text(
                  "Ídolos del Ring",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listLuch,
                      descrip: ListImages.listLuchPost),
                ),
                Text(
                  " Ídolos NFL",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listNlf,
                      descrip: ListImages.listPostNlf),
                ),
                Text(
                  "Ídolos MMA y UFC",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                    images: ListImages.listUFC,
                    descrip: ListImages.listUFC,
                  ),
                ),
                Text(
                  "La mejor raquetbolista del mundo",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listRacket,
                      descrip: ListImages.listPotsRacket),
                ),
                Text(
                  "Ídolos NBA",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listNba, descrip: ListImages.listNba),
                ),
                Text(
                  "Única mujer mexicana en WWE",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listWomanWwe,
                      descrip: ListImages.listWomanWwe),
                ),
                Text(
                  "Invitado especial de la WBC :",
                  style: TextStyle(
                    fontSize: width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageGrid(
                      images: ListImages.listBBX, descrip: ListImages.listBBX),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(26, 163, 224, 217),
          ),
          width: width,
          height: height / 1.3,
          child: Stack(children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: width,
                height: height / 2,
                child: HoverContainer(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/rectangle_6.png',
                        width: width,
                        height: height / 4,
                      ),
                      Text(
                        'Próximos Eventos',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width / 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: width,
                height: height / 2,
                child: HoverContainer(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/rectangle_20.png',
                        width: width,
                        height: height / 3.5,
                      ),
                      Text(
                        'Meet & Greet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width / 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          width: width,
          height: height / 6.5,
          child: Footer(),
        ),
      ],
    );
  }
}
