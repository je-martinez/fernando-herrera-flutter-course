import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Progress Screen')),
        body: _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text("Circular Progress"),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Color.fromARGB(96, 43, 22, 22),
        ),
        Text("Circular & Linear  Controlled"),
        SizedBox(
          height: 20,
        ),
        _ControlledProgressIndicator()
      ],
    ));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return ((value * 2) / 100).toDouble();
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 2,
                    backgroundColor: Colors.black12,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(child: LinearProgressIndicator(value: progressValue))
                ],
              ));
        });
  }
}
