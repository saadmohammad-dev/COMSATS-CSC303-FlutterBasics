import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(home: ButtonScreen()));
}

class ButtonScreen extends StatelessWidget{

const ButtonScreen({super.key});

Widget build(BuildContext contex){
return Scaffold(

appBar: AppBar(title: const Text("Button and Snackbar")),
body: Center(
  child: ElevatedButton(child: const Text("Click Here"),

  onPressed: (){
ScaffoldMessenger.of(contex).showSnackBar(
const SnackBar(content: Text(""),
duration: Duration(seconds: 3),
),
);
  },
  ),
),
);

}
}