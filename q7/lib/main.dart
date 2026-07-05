import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DisableButtonScreen()));
}

class DisableButtonScreen extends StatefulWidget {
  const DisableButtonScreen({super.key});

  @override
  State<DisableButtonScreen> createState() => _DisableButtonScreenState();
}

class _DisableButtonScreenState extends State<DisableButtonScreen> {
  // 1. Variables to track the state
  String _message = ""; 
  bool _isButtonDisabled = false;

  void _handlePress() {
    setState(() {
      // 2. Change the text and set the disabled flag to true
      _message = "Hello Guys";
      _isButtonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disable Button ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Shows "hello world" only after clicking
            Text(
              _message,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              // 3. Logic: If _isButtonDisabled is true, onPressed is null
              onPressed: _isButtonDisabled ? null : _handlePress,
              child: Text(_isButtonDisabled ? "Disabled" : "Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}