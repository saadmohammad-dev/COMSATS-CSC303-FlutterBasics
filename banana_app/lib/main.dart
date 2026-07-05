import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Banana Loader'),
          backgroundColor: Colors.yellow[700],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Check out this asset:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Flutter will now find this because 'assets' is at the root
              Image.asset(
                'assets/images/banana.jpg',
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}