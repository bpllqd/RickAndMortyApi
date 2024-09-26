import 'package:kdigital_test/src/di/main_di_module.dart';
import 'package:flutter/material.dart';
import 'package:kdigital_test/src/presentation/screens/main_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Test app',
      home: const MainScreen(),
    );
  }
}
