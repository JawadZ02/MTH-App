import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ComplexPage extends StatefulWidget {
  const ComplexPage({super.key});

  @override
  State<ComplexPage> createState() => _ComplexPageState();
}

class _ComplexPageState extends State<ComplexPage> {
  // inputs
  String r1 = '';
  String i1 = '';
  String r2 = '';
  String i2 = '';

  double r1Double = 0;
  double i1Double = 0;
  double r2Double = 0;
  double i2Double = 0;

  // outputs
  List<double> y = [];
  double realPartAdd = 0;
  double imagPartAdd = 0;
  double realPartSub = 0;
  double imagPartSub = 0;
  double realPartMulti = 0;
  double imagPartMulti = 0;
  double realPartDiv = 0;
  double imagPartDiv = 0;
  double realPartConj1 = 0;
  double imagPartConj1 = 0;
  double realPartConj2 = 0;
  double imagPartConj2 = 0;

  String realPartAddString = '';
  String imagPartAddString = '';
  String realPartSubString = '';
  String imagPartSubString = '';
  String realPartMultiString = '';
  String imagPartMultiString = '';
  String realPartDivString = '';
  String imagPartDivString = '';
  String realPartConjString1 = '';
  String imagPartConjString1 = '';
  String realPartConjString2 = '';
  String imagPartConjString2 = '';

  //flags
  int error = 1;

List<double> complex(double r1, double i1, double r2, double i2) {
    double realPartAdd = r1 + r2;
    double imagPartAdd = i1 + i2;
    double realPartSub = r1 - r2;
    double imagPartSub = i1 - i2;
    double realPartMulti = r1 * r2 - i1 * i2;
    double imagPartMulti = r1 * i2 + i1 * r2;
    double a = r1, b = i1, c = r2, d = i2;
    double realPartDiv = (a * c + b * d) / (c * c + d * d);
    double imagPartDiv = (b * c - a * d) / (c * c + d * d);
    double realPartConj1 = r1;
    double imagPartConj1 = -i1;
    double realPartConj2 = r2;
    double imagPartConj2 = -i2;
    return [
      realPartAdd,imagPartAdd,realPartSub,imagPartSub,realPartMulti,imagPartMulti,
      realPartDiv,imagPartDiv,realPartConj1,imagPartConj1, realPartConj2, imagPartConj2];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Set to false to prevent squashing the app when keyboard is open
      appBar: AppBar(
        title: const Text(
          'C O M P L E X',
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
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                child: const Image(
                  image: AssetImage('images/Complex_Code.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        'I N P U T S',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                onChanged: (value) {
                                  r1 = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'r1',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal[200]!,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                onChanged: (value) {
                                  i1 = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'i1',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal[200]!,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                onChanged: (value) {
                                  r2 = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'r2',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal[200]!,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                onChanged: (value) {
                                  i2 = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'i2',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal[200]!,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // check if all inputs are valid (not empty and correct types)
                          // if not, then show pop up message

                          // remove trailing whitespaces from inputs
                          r1 = r1.trim();
                          i1 = i1.trim();
                          r2 = r2.trim();
                          i2 = i2.trim();

                          bool inputsNotEmpty = r1.isNotEmpty &&
                              i1.isNotEmpty &&
                              r2.isNotEmpty &&
                              i2.isNotEmpty;
                          bool inputsCorrectTypes =
                              double.tryParse(r1) != null &&
                                  double.tryParse(i1) != null &&
                                  double.tryParse(r2) != null &&
                                  double.tryParse(i2) != null;

                          if (inputsNotEmpty && inputsCorrectTypes) {
                            // all inputs valid, so calculate

                            error = 0;

                            double r1Double = double.parse(r1);
                            double i1Double = double.parse(i1);
                            double r2Double = double.parse(r2);
                            double i2Double = double.parse(i2);

                            List<double> result = complex( r1Double,  i1Double,  r2Double,  i2Double);

                            setState(() {
                              realPartAdd = result[0];
                              imagPartAdd = result[1];
                              realPartSub = result[2];
                              imagPartSub = result[3];
                              realPartMulti = result[4];
                              imagPartMulti = result[5];
                              realPartDiv = result[6];
                              imagPartDiv = result[7];
                              realPartConj1 = result[8];
                              imagPartConj1 = result[9];
                              realPartConj2 = result[10];
                              imagPartConj2 = result[11];

                              realPartAddString = realPartAdd.toStringAsFixed(2);
                              imagPartAddString = imagPartAdd.toStringAsFixed(2);
                              realPartSubString = realPartSub.toStringAsFixed(2);
                              imagPartSubString = imagPartSub.toStringAsFixed(2);
                              realPartMultiString = realPartMulti.toStringAsFixed(2);
                              imagPartMultiString = imagPartMulti.toStringAsFixed(2);
                              realPartDivString = realPartDiv.toStringAsFixed(2);
                              imagPartDivString = imagPartDiv.toStringAsFixed(2);
                              realPartConjString1 = realPartConj1.toStringAsFixed(2);
                              imagPartConjString1 = imagPartConj1.toStringAsFixed(2);
                              realPartConjString2 = realPartConj2.toStringAsFixed(2);
                              imagPartConjString2 = imagPartConj2.toStringAsFixed(2);
                            });
                          } else {
                            // inputs invalid, so show pop up message
                            error = 1;

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Invalid Inputs',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  content: const Text(
                                    "Please make sure that all inputs are provided and they are all numeric.",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                            setState(() {
                              realPartAdd = 0;
                              imagPartAdd = 0;
                              realPartSub = 0;
                              imagPartSub = 0;
                              realPartMulti = 0;
                              imagPartMulti = 0;
                              realPartDiv = 0;
                              imagPartDiv = 0;
                              realPartConj1 = 0;
                              imagPartConj1 = 0;
                              realPartConj2 = 0;
                              imagPartConj2 = 0;
                            });
                          }

                          debugPrint(
                              'realPartAdd = $realPartAdd');
                        },
                        child: const Text('Calculate')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                //decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        'O U T P U T',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            error == 0
                                ? '+ = [$realPartAddString, $imagPartAddString i]\n- = [$realPartSubString, $imagPartSubString i]\n* = [$realPartMultiString, $imagPartMultiString i]\n/ = [$realPartDivString, $imagPartDivString i]\nConjugate1 = [$realPartConjString1, $imagPartConjString1 i]\nConjugate2 = [$realPartConjString2, $imagPartConjString2 i]'
                                : 'No output',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
