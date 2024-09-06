import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ioth/pages/experiment_page.dart';

// Declare serverIP as a global variable
String serverIP = '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<void> toggleRelay(int relayNumber) async {
  final response = await http.get(Uri.http(serverIP, '/toggle$relayNumber'));
  print('Response: ${response.body}');
}


class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController ipController = TextEditingController();

  

  Future<String> _checkProximity(int proximityNumber) async {
    final response =
        await http.get(Uri.http(serverIP, '/proximity$proximityNumber'));
    return response.body;
  }

  bool _isValidIP(String ipAddress) {
  List<String> parts = ipAddress.split('.');
  if (parts.length != 4) {
    return false;
  }

  for (String part in parts) {
    try {
      int value = int.parse(part);
      if (value < 0 || value > 255) {
        return false; // Each part should be between 0 and 255
      }
    } catch (e) {
      return false; // Not a valid integer
    }
  }

  return true;
}

  void _navigateToExperimentPage() async {
  if (serverIP.isNotEmpty && _isValidIP(serverIP)) {
    String proximityData = await _checkProximity(1);
    if (proximityData.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExperimentPage(),
        ),
      );
    } else {
      _showErrorDialog('Error', 'Failed to retrieve proximity data.');
      // Show an error message or take other actions if needed
    }
  } else {
    _showErrorDialog('Error', 'Please enter a valid ESP8266 IP Address.');
  }
}

void _showErrorDialog(String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SVR Hydraulic IoT KIT'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/playstore.png'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter ESP8266 IP Address'),
                      content: TextField(
                        controller: ipController,
                        decoration: const InputDecoration(
                          hintText: 'e.g., 192.168.1.100',
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            setState(() {
                              serverIP = ipController.text;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ),
                child: const Text('Enter ESP8266 IP Address'),
              ),
              ElevatedButton(
                onPressed: _navigateToExperimentPage,
                child: const Text('Submit'),
              ),
              // FutureBuilder<String>(
              //   future: _checkProximity(1),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       return Text(snapshot.data ?? '');
              //     }
              //   },
              // ),
              // FutureBuilder<String>(
              //   future: _checkProximity(2),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       return Text(snapshot.data ?? '');
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
  
}
