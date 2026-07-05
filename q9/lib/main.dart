import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AdditionScreen()));
}

class AdditionScreen extends StatefulWidget {
  const AdditionScreen({super.key});

  @override
  State<AdditionScreen> createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  
  int _result = 0;
  bool _showResult = false; // This tracks if the button was clicked

  void _calculateSum() {
    // Standard math logic
    int n1 = int.tryParse(_num1Controller.text) ?? 0;
    int n2 = int.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _result = n1 + n2;
      _showResult = true; // Now the Text widget is allowed to appear
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Q9: Adder")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter Number 1"),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter Number 2"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: const Text("Add Values"),
            ),
            const SizedBox(height: 30),
            
            // EXACT REQUIREMENT: Text widget appears ONLY after click
            if (_showResult) 
              Text(
                "Result: $_result",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}