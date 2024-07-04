import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            const SizedBox(height: 16),
            Text(
              '0',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: '3',
            child: const Text('+3'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {},
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {},
            heroTag: '1',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
