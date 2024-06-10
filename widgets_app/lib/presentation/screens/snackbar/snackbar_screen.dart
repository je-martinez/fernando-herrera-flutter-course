import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("No"),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("Yes"),
          ),
        ],
        content: const Text(
            'Officia in ut velit nulla labore adipisicing. Dolore elit ex ea do in minim laboris occaecat. Ullamco laboris velit consectetur laborum minim laboris in tempor qui. Tempor nulla ex excepteur ipsum proident commodo cupidatat deserunt proident laboris sit.'),
      ),
    );
  }

  void openDefaultLicenseDialog(BuildContext context) {
    showAboutDialog(
        context: context,
        applicationIcon: const FlutterLogo(),
        applicationName: "Widgets App",
        applicationVersion: "1.0.0",
        children: const [
          Text("This is a simple app to show different widgets in Flutter")
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () => openDefaultLicenseDialog(context),
                child: const Text("Software Licenses")),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text("Dialog"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          label: const Text('Show Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined)),
    );
  }
}
