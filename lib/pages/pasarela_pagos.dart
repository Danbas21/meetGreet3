import 'package:flutter/material.dart';
import 'package:flutter_app/pages/terminos_page.dart';
import 'package:flutter_app/utils/screen_utils.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _selectedCardType = 'Visa';
  bool _isInstallments = false;
  String? _selectedInstallmentOption;
  bool _isProcessing = false;
  bool _isTermsAccepted = false;
  bool _showTermsError = false;
  final double ticketPrice = 22000.0;

  void _processPayment() {
    setState(() {
      _showTermsError = !_isTermsAccepted;
    });

    if (_formKey.currentState!.validate() && _isTermsAccepted) {
      setState(() {
        _isProcessing = true;
      });

      Timer(const Duration(seconds: 35), () {
        setState(() {
          _isProcessing = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pago rechazado por emisor'),
          ),
        );
      });
    }
  }

  String _formatCurrency(double amount) {
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'es_MX', symbol: '\$');
    return currencyFormatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    double multiplier = ResponsiveUtil.getMultiplier(context);
    double installmentAmount = 0.0;
    if (_selectedInstallmentOption != null) {
      int months = int.parse(_selectedInstallmentOption!);
      installmentAmount = ticketPrice / months;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar pago'),
      ),
      body: _isProcessing
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(
                  left: multiplier == 1 ? 200 : 10,
                  right: multiplier == 1 ? 200 : 10,
                  top: multiplier == 1 ? 50 : 50),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Costo del boleto: ${_formatCurrency(ticketPrice)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedCardType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCardType = newValue!;
                        });
                      },
                      items: <String>['Visa', 'MasterCard', 'Amex']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Tipo de Tarjeta',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre en la Tarjeta',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese el nombre en la tarjeta';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Número de Tarjeta',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese el número de tarjeta';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _expiryDateController,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Vencimiento (MM/AA)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese la fecha de vencimiento';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _cvvController,
                      decoration: const InputDecoration(
                        labelText: 'CCV',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese el CCV';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text('Meses sin intereses'),
                      value: _isInstallments,
                      onChanged: (bool? value) {
                        setState(() {
                          _isInstallments = value!;
                          if (!_isInstallments) {
                            _selectedInstallmentOption = null;
                          }
                        });
                      },
                    ),
                    if (_isInstallments)
                      DropdownButtonFormField<String>(
                        value: _selectedInstallmentOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedInstallmentOption = newValue!;
                          });
                        },
                        items: <String>['3', '6', '9', '12']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text('$value meses'),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Seleccionar meses',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    if (_selectedInstallmentOption != null)
                      Text(
                        'Cuota mensual: ${_formatCurrency(installmentAmount)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 20),
                    CheckboxWidget(
                      isTermsAccepted: _isTermsAccepted,
                      showTermsError: _showTermsError,
                      onChanged: (bool? value) {
                        setState(() {
                          _isTermsAccepted = value!;
                          _showTermsError = !value;
                        });
                      },
                    ),
                    if (_showTermsError)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Debe aceptar los términos y condiciones',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _processPayment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text('Pagar'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  final bool isTermsAccepted;
  final bool showTermsError;
  final ValueChanged<bool?> onChanged;

  const CheckboxWidget({
    required this.isTermsAccepted,
    required this.showTermsError,
    required this.onChanged,
    super.key,
  });

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
              onChanged: widget.onChanged,
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
