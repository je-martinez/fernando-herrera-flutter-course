import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) => setState(() {
              navDrawerIndex = value;
            }),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          ),
          const DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=54'),
                ),
                SizedBox(height: 10),
                Text('Mystery Person'),
              ],
            ),
          ),
          const _CustomDividerWPadding(child: Text('Main')),
          ...appMenuItems.sublist(0, 3).map((item) =>
              NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),
          const _CustomDividerWPadding(),
          const _CustomDividerWPadding(child: Text('More Options')),
          ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon), label: Text(item.title))),
        ]);
  }
}

class _CustomDividerWPadding extends StatelessWidget {
  final Widget child;

  const _CustomDividerWPadding({
    super.key,
    this.child = const Divider(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 16, 10), child: child);
  }
}
