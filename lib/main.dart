import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_store/StoreProvider.dart';
import 'HomeScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StoreProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Store',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // A light grey color, for example
      ),
      home: const HomeScreen(),
    );
  }
}
