import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static String name = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ListView.builder(
            itemCount: appMenuItems.length,
            itemBuilder: (context, index) {
              final menuItem = appMenuItems[index];
              return _CustomListTitle(
                menuItem: menuItem,
              );
            }),
        drawer: SideMenu());
  }
}

class _CustomListTitle extends StatelessWidget {
  final MenuItem menuItem;
  const _CustomListTitle({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      trailing: Icon(Icons.arrow_forward_ios, color: colors.primary),
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   menuItem.link,
        // );
        context.push(menuItem.link);
        // GoRouter.of(context).push(
        //   menuItem.link,
        // );
      },
    );
  }
}
