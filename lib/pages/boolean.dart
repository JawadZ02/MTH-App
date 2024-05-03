import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BooleanPage extends StatefulWidget {
  const BooleanPage({super.key});

  @override
  State<BooleanPage> createState() => _BooleanPageState();
}

class _BooleanPageState extends State<BooleanPage> {
  // inputs
  String x = '';
  String y = '';

  // outputs
  int and = 0;
  int or = 0;
  int xor = 0;
  int xnor = 0;

  //flags
  int error = 1;

  List<int> boolean(int x, int y) {
    int and = 0;
    int or = 1;
    int xor = 1;
    int xnor = 1;
    if (x == 1 && y == 1) and = 1;
    if (x == 0 && y == 0) or = 0;
    if (x == y) xor =0;
    if (x != y) xnor = 0;
    return [and, or, xor, xnor];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Set to false to prevent squashing the app when keyboard is open
      appBar: AppBar(
        title: const Text(
          'B O O L E A N',
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
                  image: AssetImage('images/Boolean_Code.png'),
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
                                  x = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: '0/1',
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
                                  y = value;
                                },
                                style: const TextStyle(fontSize: 20),
                                cursorColor: Colors.teal[200],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.teal[200],
                                  hintText: '0/1',
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
                          x = x.trim();
                          y = y.trim();


                          bool inputsNotEmpty = x.isNotEmpty && y.isNotEmpty;
                          bool inputsCorrectTypes = (int.tryParse(x) != null) && (int.tryParse(y) != null);
                          bool range = true;
                          double? xParsed = double.tryParse(x);
                          double? yParsed = double.tryParse(y);
                          if(inputsCorrectTypes){
                            range = (xParsed == 0 || xParsed == 1) && (yParsed ==0 || yParsed == 1);
                          }
                          
                          if (inputsNotEmpty && inputsCorrectTypes && range) {
                            // all inputs valid, so calculate
                            error = 0;
                            int xDouble = int.parse(x);
                            int yDouble = int.parse(y);

                             List<int> answer = boolean( xDouble,  yDouble);

                            setState(() {
                              and = answer[0];
                              or = answer[1];
                              xor = answer[2];
                              xnor = answer[3];
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
                                    "Please make sure that all inputs are provided and they are all binary.",
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
                              and = 0;
                              or = 0;
                              xor = 0;
                              xnor = 0;
                            });
                          }

                          debugPrint(
                              'AND=$and');
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
                                ? 'AND = $and\nOR = $or\nXOR = $xor\nXNOR = $xnor'
                                :'No output',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 4,
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
