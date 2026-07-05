import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RegistrationPage()));
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // 1. Create Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // 2. Variables to show the result
  String _registeredName = "";
  String _registeredEmail = "";

  void _register() {
    // 3. Validation Logic
    String name = _nameController.text;
    String email = _emailController.text;

    if (name.isEmpty) {
      _showSnackbar("Please enter your name");
    } else if (email.isEmpty) {
      _showSnackbar("Please enter your email");
    } else {
      // 4. If all good, update the UI
      setState(() {
        _registeredName = name;
        _registeredEmail = email;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text("Register"),
            ),
            const SizedBox(height: 40),
            
            // 5. Text widgets to show the information
            const Text("Registered Info:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Name: $_registeredName"),
            Text("Email: $_registeredEmail"),
          ],
        ),
      ),
    );
  }
}