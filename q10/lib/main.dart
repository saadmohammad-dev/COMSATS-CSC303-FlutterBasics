import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MiniCalculator()));
}

class MiniCalculator extends StatefulWidget {
  const MiniCalculator({super.key});

  @override
  State<MiniCalculator> createState() => _MiniCalculatorState();
}

class _MiniCalculatorState extends State<MiniCalculator> {
  // 1. Initialize with "0" as requested
  final TextEditingController _controller = TextEditingController(text: "0");

  // Function to add characters to the screen
  void _btnClick(String value) {
    setState(() {
      // If screen just shows "0", replace it. Otherwise, add to it.
      if (_controller.text == "0") {
        _controller.text = value;
      } else {
        _controller.text = _controller.text + value;
      }
    });
  }

  // Function to calculate the sum
  void _calculate() {
    // Split the text by '+' into a list of strings
    List<String> parts = _controller.text.split('+');
    
    int total = 0;
    for (String part in parts) {
      // Convert each part to a number and add to total
      total += int.tryParse(part) ?? 0;
    }

    setState(() {
      _controller.text = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Q10: Mini Calc")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              //readOnly: true, // User uses buttons, not keyboard
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("+"),
                
                // Equal button has its own logic
                ElevatedButton(onPressed: _calculate, child: const Text("=")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to keep code clean
  Widget _buildButton(String label) {
    return ElevatedButton(
      onPressed: () => _btnClick(label),
      child: Text(label),
    );
  }
}