import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FactorialPage extends StatefulWidget {
  const FactorialPage({super.key});

  @override
  State<FactorialPage> createState() => _FactorialPageState();
}

class _FactorialPageState extends State<FactorialPage> {

  int factorial(int n) {
    int x = 1;
    for (int i = 1; i <= n; i++) {
      x = x * i;
    }
    return x;
  }

  // inputs
  String input = '';

  // outputs
  int output = 0;
  String outputString = '';

  //flags
  int error = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Set to false to prevent squashing the app when keyboard is open
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                child: const Image(
                  image: AssetImage('images/Factorial_Code.png'),
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
                        'I N P U T',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                onChanged: (value) {
                                  input = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: 'input',
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

                          input = input.trim();

                          bool inputsNotEmpty = input.isNotEmpty;
                          bool inputsCorrectTypes =
                              int.tryParse(input) != null;
                          
                          bool range = true;
                          double? inputParsed = double.tryParse(input);
                          if(inputsCorrectTypes){
                            range = inputParsed! >= 0 && inputParsed <= 18;
                          }

                          

                          if (inputsNotEmpty && inputsCorrectTypes && range) {
                            // all inputs valid, so calculate
                            error = 0;
                          setState(() {
                              output = factorial(int.parse(input));
                            });
                          } else {
                            // inputs invalid, so show pop up message
                            error = 1;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Invalid Input',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  content: const Text(
                                    "Please make sure that all inputs are provided and they are all numeric. Make sure you enter a number greater than or equal to 0 and less than or equal to 18.",
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
                              input = '';
                              output = 0;
                            });
                          }
                          // check if all inputs are valid (not empty and correct types)
                          // if not, then show pop up message

                          // remove trailing whitespaces from inputs

                          setState(() {
                              output = factorial(int.parse(input));
                            });
                          debugPrint(
                              'input = $input, output = $output');
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
                            error == 0 ? 'output = $output' : 'No output',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 10,
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

