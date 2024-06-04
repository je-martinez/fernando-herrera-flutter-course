import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;

  String get message {
    if (counter == 1) {
      return 'Tap';
    } else {
      return 'Taps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Counter Functions Screen",
              style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                highlightColor: Colors.transparent,
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: Colors.black,
                )),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter',
                style: const TextStyle(
                    fontSize: 120, fontWeight: FontWeight.w200)),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RoundButton(
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              icon: Icons.refresh_outlined),
          const SizedBox(height: 10),
          RoundButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icons.plus_one,
          ),
          const SizedBox(height: 10),
          RoundButton(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                setState(() {
                  counter--;
                });
              }),
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  IconData icon;
  VoidCallback onPressed;

  RoundButton({
    super.key,
    this.icon = Icons.exposure_zero,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      enableFeedback: true,
      child: Icon(icon),
    );
  }
}
