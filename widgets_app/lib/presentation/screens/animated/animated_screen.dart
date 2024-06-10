import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;
  double percentageValue = 1;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300).toDouble() + 120;
    height = random.nextInt(300).toDouble() + 120;
    color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    borderRadius = random.nextInt(100).toDouble();
    percentageValue = random.nextInt(100).toDouble() / 100;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                tween: Tween<double>(
                  begin: 0,
                  end: percentageValue,
                ),
                builder: (context, value, _) =>
                    LinearProgressIndicator(value: value),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCirc,
              width: width < 0 ? 0 : width,
              height: height < 0 ? 0 : height,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
