import 'package:example/example_switcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ExampleSwitcher(),
        ),
      )),
    );
  }
}
