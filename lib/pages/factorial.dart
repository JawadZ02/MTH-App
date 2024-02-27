import 'package:flutter/material.dart';

class FactorialPage extends StatelessWidget {
  const FactorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'F A C T O R I A L',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.teal[200],
        foregroundColor: Colors.white,
      ),
    );
  }
}
