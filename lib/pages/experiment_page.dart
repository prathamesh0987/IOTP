import 'package:flutter/material.dart';

import 'package:ioth/experiments/experiment_1.dart';
import 'package:ioth/experiments/experiment_2.dart';
import 'package:ioth/experiments/experiment_3.dart';
import 'package:ioth/experiments/experiment_4.dart';
import 'package:ioth/experiments/experiment_5.dart';
import 'package:ioth/experiments/experiment_6.dart';

import 'package:ioth/widgets/experiment_button.dart';
import 'package:ioth/widgets/experiment_dropdown.dart';

class ExperimentPage extends StatefulWidget {
  @override
  _ExperimentPageState createState() => _ExperimentPageState();
}

class _ExperimentPageState extends State<ExperimentPage> {
  String selectedExperiment = 'Single Acting Cylinder'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment Page'),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/playstore.png', // Replace with the actual asset image path
            height: 200,
            width: 200,
          ),
          SizedBox(height: 20),
          ExperimentDropdown(
            value: selectedExperiment,
            onChanged: (String? value) {
              setState(() {
                selectedExperiment = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExperimentButton(
                'Submit',
                onPressed: () {
                  // Handle submit button press
                  _navigateToExperimentPage(selectedExperiment);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToExperimentPage(String selectedExperiment) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        // Navigate to the corresponding experiment page based on the selection
        if (selectedExperiment == 'Single Acting Cylinder') {
          return Experiment1();
        } else if (selectedExperiment == 'Two Hand Safety Circuit') {
          return Experiment2();
        } else if (selectedExperiment == '5/2 Valve as Memory Valve') {
          return Experiment3();
        } else if (selectedExperiment == 'Double Acting Cylinder') {
          return Experiment4();
        } else if (selectedExperiment == 'Two Cylinder Pneumatic Circuit') {
          return Experiment5();
        } else if (selectedExperiment == 'Sequential Pneumatic Circuit') {
          return Experiment6();
        }
        // Add more conditions for other experiments as needed
        return Container(); // Return a default page or an empty container if needed
      }),
    );
  }
}
