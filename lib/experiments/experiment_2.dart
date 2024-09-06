import 'package:flutter/material.dart';
import 'package:ioth/pages/home_page.dart';

class Experiment2 extends StatefulWidget {
  @override
  _Experiment2State createState() => _Experiment2State();
}

class _Experiment2State extends State<Experiment2> {
  bool emgPressed = true;
  bool autoManualPressed = true;
  bool x0Pressed = true;
  bool y0Pressed = true;
  bool z0Pressed = true;
          
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Hand Safety Circuit'),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/experiment_2.png', // Replace with the actual path to your PNG image
                fit: BoxFit.contain, // Adjust the BoxFit property as needed
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  x0Pressed = !x0Pressed;
                });
                // Handle X0 button press
                toggleRelay(1); // Use the toggleRelay function from home_page.dart
              },
              style: ElevatedButton.styleFrom(
                primary: x0Pressed ? Colors.green[200] : Colors.green,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('X2'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  y0Pressed = !y0Pressed;
                });
                // Handle Y0 button press
                toggleRelay(2); // Use the toggleRelay function from home_page.dart
              },
              style: ElevatedButton.styleFrom(
                primary: y0Pressed ? Colors.red[200] : Colors.red,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('X3'),
            ),
            SizedBox(height: 10),
           
          ],
        ),
      ),
    );
  }
}
