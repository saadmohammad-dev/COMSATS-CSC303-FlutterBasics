import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CapitalizerScreen()));
}

class CapitalizerScreen extends StatefulWidget {
  const CapitalizerScreen({super.key});

  @override
  State<CapitalizerScreen> createState() => _CapitalizerScreenState();
}

class _CapitalizerScreenState extends State<CapitalizerScreen> {
  // 1. Controller for the second TextField (The Mirror)
  final TextEditingController _outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField Capitalizer")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // FIRST TEXTFIELD: User types here
            TextField(
              decoration: const InputDecoration(
                labelText: "Type something here",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // 2. This runs every time you press a key
                setState(() {
                  // We update the second controller with the uppercase version
                  _outputController.text = value.toUpperCase();
                });
              },
            ),
            
            const SizedBox(height: 30),

            // SECOND TEXTFIELD: Automatically shows capital letters
            TextField(
              controller: _outputController,
              readOnly: true, // Optional: Makes it so you can't type in this one directly
              decoration: const InputDecoration(
                labelText: "Capitalized version",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey, // Visual hint that it's an output
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Clean up the controller when the widget is destroyed
  @override
  void dispose() {
    _outputController.dispose();
    super.dispose();
  }
}