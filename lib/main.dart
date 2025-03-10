import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget ini merupakan root dari aplikasi.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi CV',
      theme: ThemeData(
        // Tema aplikasi dengan ColorScheme yang menggunakan seedColor.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
