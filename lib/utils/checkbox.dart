import 'package:flutter/material.dart';
import 'package:flutter_app/pages/terminos_page.dart';

class CheckboxWidget extends StatefulWidget {
  final bool isTermsAccepted;
  final bool showTermsError;
  final ValueChanged<bool> onChanged;

  const CheckboxWidget({
    required this.isTermsAccepted,
    required this.showTermsError,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  CheckboxWidgetState createState() => CheckboxWidgetState();
}

class CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: widget.isTermsAccepted,
              onChanged: widget.onChanged as void Function(bool?)?,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Terminos()),
                );
              },
              child: const Text(
                'POR FAVOR REVISE NUESTRA POLÍTICA DE PRIVACIDAD Y TÉRMINOS DEL SERVICIO.\nMARQUE SI ESTA DE ACUERDO CON LOS TÉRMINOS Y CONDICIONES.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: 'Arial',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
