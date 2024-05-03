import 'package:flutter/material.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';

class VectorsPage extends StatefulWidget {
  const VectorsPage({super.key});

  @override
  State<VectorsPage> createState() => _VectorsPageState();
}

class _VectorsPageState extends State<VectorsPage> {
  // inputs
  String yinit = '';
  String h = '';
  String tinit = '';
  String tfinal = '';

  // outputs
  List<double> y = [];
  List<double> t = [];

  List<List<double>> euler(
      double tinit, double tfinal, double yinit, double h) {
    List<double> y = [];
    List<double> t = [];
    f(double t, double y) => 4 * exp(0.8 * t) - 0.5 * y;
    int N = (tfinal - tinit) ~/ h;
    y.add(yinit);
    t.add(tinit);
    for (int i = 1; i < N + 1; i++) {
      t.add(((t[i - 1] + h) * 10).round() / 10);
      y.add(y[i - 1] + h * f(t[i - 1], y[i - 1]));
    }
    return [y, t];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Set to false to prevent squashing the app when keyboard is open
      appBar: AppBar(
        title: const Text(
          'D I F F E R E N T I A L   E Q \' S',
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
                  image: AssetImage('images/Euler_Code.png'),
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
                                  yinit = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'yinit',
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
                                  h = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'h',
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
                                  tinit = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'tinit',
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
                                  tfinal = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'tfinal',
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
                          tinit = tinit.trim();
                          tfinal = tfinal.trim();
                          yinit = yinit.trim();
                          h = h.trim();

                          bool inputsNotEmpty = tinit.isNotEmpty &&
                              tfinal.isNotEmpty &&
                              yinit.isNotEmpty &&
                              h.isNotEmpty;
                          bool inputsCorrectTypes =
                              double.tryParse(tinit) != null &&
                                  double.tryParse(tfinal) != null &&
                                  double.tryParse(yinit) != null &&
                                  double.tryParse(h) != null;

                          if (inputsNotEmpty && inputsCorrectTypes) {
                            // all inputs valid, so calculate

                            double tinitValue = double.parse(tinit);
                            double tfinalValue = double.parse(tfinal);
                            double yinitValue = double.parse(yinit);
                            double hValue = double.parse(h);

                            List<List<double>> result = euler(
                                tinitValue, tfinalValue, yinitValue, hValue);

                            setState(() {
                              y = result[0];
                              t = result[1];
                            });
                          } else {
                            // inputs invalid, so show pop up message
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
                              y = [];
                              t = [];
                            });
                          }

                          debugPrint(
                              'h = $h, tinit = $tinit, tfinal = $tfinal, yinit = $yinit, y=$y, t=$t');
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
                            't = ${t.map((double value) => value.toStringAsFixed(1)).join(', ')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          AutoSizeText(
                            'y = ${y.map((double value) => value.toStringAsFixed(2)).join(', ')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
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
