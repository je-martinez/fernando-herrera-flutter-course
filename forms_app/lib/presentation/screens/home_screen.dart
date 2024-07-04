import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ListTile(
            title: Text('Cubits'),
            subtitle: Text('Gestor de estado simple'),
          ),
          ListTile(
            title: Text(''),
          ),
          ListTile(
            title: Text('Item 3'),
          ),
        ],
      ),
    );
  }
}
