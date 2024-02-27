import 'package:flutter/material.dart';

class MatricesPage extends StatelessWidget {
  const MatricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'M A T R I C E S',
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
