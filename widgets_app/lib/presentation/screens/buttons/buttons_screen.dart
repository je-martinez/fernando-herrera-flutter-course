import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Elevated Icon"),
                icon: const Icon(
                  Icons.access_alarm_outlined,
                )),
            FilledButton(onPressed: () {}, child: const Text("Filled Button")),
            FilledButton.icon(
                onPressed: () {},
                label: const Text("Filled Icon"),
                icon: const Icon(Icons.picture_as_pdf_sharp)),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined Button")),
            OutlinedButton.icon(
                onPressed: () {},
                label: const Text("Outlined Icon"),
                icon: const Icon(Icons.access_alarm_outlined)),
            TextButton(onPressed: () {}, child: const Text("Text Button")),
            TextButton.icon(
                onPressed: () {},
                label: const Text("Text Icon"),
                icon: const Icon(Icons.access_alarm_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.access_alarm_outlined)),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.access_alarm_outlined,
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary),
                  iconColor: WidgetStatePropertyAll(colors.onPrimary)),
            ),
            const _CustomButton()
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
