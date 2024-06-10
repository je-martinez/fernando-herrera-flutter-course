import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('This is a snackbar'),
      action: SnackBarAction(
        label: 'OK!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          label: const Text('Show Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined)),
    );
  }
}
