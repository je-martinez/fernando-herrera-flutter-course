import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/providers.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
            onPressed: () {
              // ref
              //     .read(isDarkModeProvider.notifier)
              //     .update((isDarkMode) => !isDarkMode);
              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
            activeColor: color,
            title: Text("Color",
                style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            subtitle: Text('#${color.value.toRadixString(16)}'),
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              if (value == null) return;
              // ref.read(selectedColorProvider.notifier).state = value;
              ref.read(themeNotifierProvider.notifier).changeColor(value);
            });
      },
    );
  }
}
