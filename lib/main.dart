import 'package:flutter/material.dart';
import 'package:mth_app/pages/differential.dart';
import 'package:mth_app/pages/factorial.dart';
import 'package:mth_app/pages/matrices.dart';
import 'package:mth_app/pages/series.dart';
import 'package:mth_app/pages/arithmetic.dart';
import 'package:mth_app/pages/boolean.dart';
import 'package:mth_app/pages/complex.dart';
import 'package:mth_app/pages/linearsystems.dart';
import 'package:mth_app/pages/polynomial.dart';
import 'package:mth_app/pages/vectors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math App',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.teal[100]!),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20), // Set the default text size here
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> buttonNames = ['Arithmetic Operations', 'Boolean Algebra', 'Complex Numbers Operations', 'Differential Equations', 'Factorial', 'Linear Systems', 'Matrices', '2nd order Polynomial solver', 'Series', 'Vectors'];
    final List<Function()?> navigationFunctions = [
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ArithmeticPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BooleanPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ComplexPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DifferentialPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FactorialPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LinearsystemsPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MatricesPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PolynomialPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SeriesPage())),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VectorsPage())),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '+  -   M A T H  A P P   -  +',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.teal[200],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                //decoration: BoxDecoration(border: Border.all(width: 1)),
                alignment: Alignment.center,
                child: const Text(
                  'Click on the tutorial you would like to view.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                //decoration: BoxDecoration(border: Border.all(width: 1)),
                child: ListView.separated(
                  itemCount: buttonNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                        onPressed: navigationFunctions[index],
                        child: Text(buttonNames[index]));
                  },
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                        height: 20);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
