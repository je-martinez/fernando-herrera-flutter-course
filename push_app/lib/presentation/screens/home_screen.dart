import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home';
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {})
        ],
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
