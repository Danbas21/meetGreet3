import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_page.dart';
import 'package:flutter_app/utils/bar_navegacion.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'package:flutter_app/utils/widget_circulo.dart';
import 'package:flutter_app/utils/widget_grid_cir.dart';

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double av = ResponsiveUtil.getMultiplier(context);

    return Scaffold(
      appBar: const BarNavi(),
      drawer: width < 1024 ? const AppDrawer() : null,
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                right: -width / 4,
                top: height / 3,
                child: SizedBox(
                  width: width / 1.7,
                  height: height / 1.2,
                  child: const Circumference(
                    opacity: 100,
                  ),
                ),
              ),
              Positioned(
                left: -width / 4,
                bottom: height / 2,
                child: SizedBox(
                  width: width / 1.7,
                  height: height / 1.2,
                  child: const Circumference(
                    opacity: 100,
                  ),
                ),
              ),
              Positioned(
                right: width /
                    (av == 1.0
                        ? 12
                        : av == .65
                            ? 20
                            : 7),
                top: height /
                    (av == 1.0
                        ? 12
                        : av == .65
                            ? 10
                            : 16),
                child: SizedBox(
                  width: width /
                      (av == 1.0
                          ? 11
                          : av == .65
                              ? 6
                              : 4),
                  height: height / 10,
                  child: const CirculosEnGrid(),
                ),
              ),
              Positioned(
                left: width /
                    (av == 1.0
                        ? 12
                        : av == .65
                            ? 20
                            : 7),
                bottom: height /
                    (av == 1.0
                        ? 50
                        : av == .65
                            ? 50
                            : 8),
                child: SizedBox(
                  width: width /
                      (av == 1.0
                          ? 11
                          : av == .65
                              ? 6
                              : 4),
                  height: height / 10,
                  child: const CirculosEnGrid(),
                ),
              ),
              Positioned(
                left: av == 1.0
                    ? 30
                    : av == .65
                        ? 30
                        : 10,
                top: av == 1.0
                    ? 160
                    : av == .65
                        ? 50
                        : 45,
                child: SizedBox(
                  width: 900 * av,
                  height: 150 * av,
                  child: Text(
                    'Contacto',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (width /
                          (av == 1.0
                              ? 20
                              : av == .65
                                  ? 12
                                  : 10)),
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height /
                    (av == 1.0
                        ? 3
                        : av == .65
                            ? 3
                            : 3),
                right: .1,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, 10 * _animation.value),
                                child: child,
                              );
                            },
                            child: _buildTextField('Nombre'),
                          ),
                          const SizedBox(height: 10),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, -10 * _animation.value),
                                child: child,
                              );
                            },
                            child: _buildTextField('Correo Electrónico'),
                          ),
                          SizedBox(height: 16),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, -10 * _animation.value),
                                child: child,
                              );
                            },
                            child: _buildTextField('Descripción', maxLines: 5),
                          ),
                          SizedBox(height: 32),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: 1.2 - 0.2 * _animation.value,
                                child: child,
                              );
                            },
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Enviando comentarios')),
                                  );
                                }
                              },
                              child: Text('Enviar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese $label';
        }
        return null;
      },
    );
  }
}
