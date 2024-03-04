import 'package:flutter/material.dart';
import 'package:wiki_app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wiki App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 49, 211, 184)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
