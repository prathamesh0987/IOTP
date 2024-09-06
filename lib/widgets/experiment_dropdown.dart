import 'package:flutter/material.dart';

class ExperimentDropdown extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;

  ExperimentDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: [
        'Single Acting Cylinder',
        'Two Hand Safety Circuit',
        '5/2 Valve as Memory Valve',
        'Double Acting Cylinder',
        'Two Cylinder Pneumatic Circuit',
        'Sequential Pneumatic Circuit',
      ].map((String experimentName) {
        return DropdownMenuItem<String>(
          value: experimentName,
          child: Text(experimentName),
        );
      }).toList(),
      hint: Text('Select Experiment'),
    );
  }
}
