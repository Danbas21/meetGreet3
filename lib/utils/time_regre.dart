import 'dart:async';
import 'package:flutter/material.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  CountdownPageState createState() => CountdownPageState();
}

class CountdownPageState extends State<CountdownPage> {
  final targetDate = DateTime.utc(2024, 10, 26);
  Timer? _timer;
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeRemaining();
    });
  }

  void _calculateTimeRemaining() {
    final now = DateTime.now().toUtc();
    final difference = targetDate.difference(now);

    if (difference.isNegative) {
      _timer?.cancel(); // Stop the timer if the target date has passed
      setState(() {
        _timeRemaining = Duration.zero;
      });
    } else {
      setState(() {
        _timeRemaining = difference;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double av = ResponsiveUtil.getMultiplier(context);

    final days = _timeRemaining.inDays;
    final hours = _timeRemaining.inHours % 24;
    final minutes = _timeRemaining.inMinutes % 60;
    final seconds = _timeRemaining.inSeconds % 60;

    return Text(
      'Faltan: $days días, $hours horas, $minutes minutos, $seconds segundos',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: width / (av == 1.0 ? 30 : 12),
        color: const Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class ResponsiveUtil {
  static double getMultiplier(BuildContext context) {
    // Implement your responsive multiplier logic here
    return 1.0;
  }
}
