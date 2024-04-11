import 'package:flutter/material.dart';
import 'dart:math';

final _formKey = GlobalKey<FormState>();


String? integerValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Pls Enter an int';
  }
  // Try parsing the input as an integer
  if (int.tryParse(name) == null) {
    return 'Pls Enter an int';
  }
  return null; // Input is valid
}


// ignore: must_be_immutable
class DifferentialPage extends StatefulWidget {
  DifferentialPage({super.key});

  @override
  State<DifferentialPage> createState() => _DifferentialPageState();
}

class _DifferentialPageState extends State<DifferentialPage> {

  String yinit = '';
  String h = '';
  String tinit = '';
  String tfinal = '';
  List<List<double>> euler(double tinit, double tfinal, double yinit, double h) {
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
  List<double> y = [];
  List<double> t = [];

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
              child: FittedBox(
                child: Container(alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey)),
              child: const Image(image: AssetImage('images/Euler_Code.png'),
                ),
              ),),

            ),
            Expanded(
              child: Form(
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
                          )),
                      Form(
  key: _formKey,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: TextFormField(
              onChanged: (value) {
                yinit = value;
              },
              style: const TextStyle(fontSize: 20),
              cursorColor: Colors.teal[200],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.teal[200],
                hintText: 'yinit',
                hintStyle: const TextStyle(color: Colors.grey),
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
              validator: integerValidator,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: TextFormField(
              onChanged: (value) {
                h = value;
              },
              style: const TextStyle(fontSize: 20),
              cursorColor: Colors.teal[200],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.teal[200],
                hintText: 'h',
                hintStyle: const TextStyle(color: Colors.grey),
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
              validator: integerValidator,
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
                hintStyle: const TextStyle(color: Colors.grey),
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
              validator: integerValidator,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: TextFormField(
              onChanged: (value) {
                tfinal = value;
              },
              style: const TextStyle(fontSize: 20),
              cursorColor: Colors.teal[200],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.teal[200],
                hintText: 'tfinal',
                hintStyle: const TextStyle(color: Colors.grey),
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
              validator: integerValidator,
            ),
          ),
          const Spacer(),
        ],
      ),
    ],
  ),
),

                      ElevatedButton(
                          onPressed: () {
                            
                            setState(() {
                              _formKey.currentState!.validate();
                              if( _formKey.currentState!.validate()){
                                y = [];
                            t = [];
                            double tinitValue = double.parse(tinit);
                            double tfinalValue = double.parse(tfinal);
                            double yinitValue = double.parse(yinit);
                            double hValue = double.parse(h);
                              List<List<double>> result = euler(
                            tinitValue, tfinalValue, yinitValue, hValue);
                            y=result[0];
                            t = result[1];
                              }
                            
                            else{
                            y = [];
                            t = [];
                            }
                
                            
                            });
                            int ylength = y.length;
                            debugPrint(
                                'h = $h, tinit = $tinit, tfinal = $tfinal, yinit = $yinit, yone = ${y[1]}, ylength=$ylength');
                          },
                          child: const Text('Calculate')),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                //decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column( 
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
                          Text(
                        't = ${t.map((double value) => value.toStringAsFixed(0)).join(', ')}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'y = ${y.map((double value) => value.toStringAsFixed(0)).join(', ')}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                    ]
                    
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}