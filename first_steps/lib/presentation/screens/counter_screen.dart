import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Counter Screen", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter',
                style: const TextStyle(
                    fontSize: 120, fontWeight: FontWeight.w200)),
            const SizedBox(height: 10),
            const Text(
              'Taps',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
          //counter++;
          //setState(() {});
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
