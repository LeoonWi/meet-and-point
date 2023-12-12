import 'package:flutter/material.dart';
import 'package:meet_and_point/auth/login.dart';
import 'package:meet_and_point/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF285BC0),
      ),
      home: const LoginPage(),
      // const HomePage(),
    );
  }
}