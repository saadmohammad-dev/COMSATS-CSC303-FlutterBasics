import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TransferScreen()));
}

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {         
  // 1. Create the two controllers
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  void _transferText() {
    // 2. The Logic: Assign text from 1 to 2
    setState(() {
      _secondController.text = _firstController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Transfer App")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _firstController,
              decoration: const InputDecoration(
                labelText: "Enter text here",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // THE BUTTON: This triggers the transfer
            ElevatedButton(
              onPressed: _transferText, 
              child: const Text("Transfer Text"),
            ),
            
            const SizedBox(height: 20),
            
            TextField(
              controller: _secondController,
              decoration: const InputDecoration(
                labelText: "Result will appear here",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Good practice: Dispose controllers to save memory on your i5 laptop
  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }
}