import 'package:flutter/material.dart';

void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the red corner banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruit App'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Banana Card
              fruitCard('assets/images/banana.jpg', 'Banana'),
              const SizedBox(height: 20),
              // Orange Card
              fruitCard('assets/images/orange.jpg', 'Orange'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create the fruit card design
  Widget fruitCard(String imagePath, String title) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, width: 100),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}