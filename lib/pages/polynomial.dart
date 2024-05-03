import 'package:flutter/material.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';

class PolynomialPage extends StatefulWidget {
  const PolynomialPage({super.key});

  @override
  State<PolynomialPage> createState() => _PolynomialPageState();
}

class _PolynomialPageState extends State<PolynomialPage> {
  // inputs
  String a = '';
  String b = '';
  String c = '';

  // outputs
  double root1 = 0;
  double root2 = 0;
  double root1Img = 0;
  double root2Img = 0;

  String root1String ='';
  String root2String ='';
  String root1ImgString ='';
  String root2ImgString ='';

  //flags
  int error = 1;
  int length = 0;
  
  //You need to import as follows: import 'dart:math';
  List<double> calculateRoots(double a, double b, double c) {
    List<double> roots = [];
    double discriminant = b * b - 4 * a * c;
    if (discriminant > 0) {
      double root1 = (-b + sqrt(discriminant)) / (2 * a);
      double root2 = (-b - sqrt(discriminant)) / (2 * a);
      roots = [root1, root2];
    } else if (discriminant == 0) {
      double root = -b / (2 * a);
      roots = [root, root];
    } else {// Imaginary roots
      double realPart = -b / (2 * a);
      double imaginaryPart = sqrt(-discriminant) / (2 * a);
      roots = [realPart, imaginaryPart, realPart, -imaginaryPart];
    }
    return roots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Set to false to prevent squashing the app when keyboard is open
      appBar: AppBar(
        title: const Text(
          'P O L Y N O M I A L',
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
                  image: AssetImage('images/Polynomial_Code.png'),
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
                                  a = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'a',
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
                                  b = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'b',
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
                                  c = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'c',
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
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // check if all inputs are valid (not empty and correct types)
                          // if not, then show pop up message

                          // remove trailing whitespaces from inputs
                          a = a.trim();
                          b = b.trim();
                          c = c.trim();

                          bool inputsNotEmpty = a.isNotEmpty &&
                              b.isNotEmpty &&
                              c.isNotEmpty;
                          bool inputsCorrectTypes =
                              double.tryParse(a) != null &&
                                  double.tryParse(b) != null &&
                                  double.tryParse(c) != null;

                          if (inputsNotEmpty && inputsCorrectTypes) {
                            // all inputs valid, so calculate
                            error = 0;
                            double aDouble = double.parse(a);
                            double bDouble = double.parse(b);
                            double cDouble = double.parse(c);

                            List<double> result = calculateRoots( aDouble,  bDouble,  cDouble);

                            setState(() {
                              length = result.length;
                              if(result.length ==4){
                              root1 = result[0];
                              root1String = root1.toStringAsFixed(2);
                              root1Img = result[1];
                              root1ImgString = root1Img.toStringAsFixed(2);
                              root2 = result[2];
                              root2String = root2.toStringAsFixed(2);
                              root2Img = result[3];
                              root2ImgString = root2Img.toStringAsFixed(2);
                              }
                              else{root1 = result[0];
                              root1String = root1.toStringAsFixed(2);
                              root2 = result[1];
                              root2String = root2.toStringAsFixed(2);}
                            });
                          } else {
                            error = 1;
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
                              root1 = 0;
                              root2 = 0;
                            });
                          }

                          debugPrint(
                              'root1 = $root1, root2 = $root2');
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
                            error == 0?
                            
                            length == 2? 'root1 = $root1String' : 'root1 = [$root1String, $root1ImgString i]' : 'No output',

                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          AutoSizeText(
                            error == 0?
                                 length == 2?
                                     'root2 = $root2String'
                                    : 'root2 = [$root2String, $root2ImgString i]' 
                                    : '',
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
