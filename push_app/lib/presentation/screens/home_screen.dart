import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home';
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((NotificationsBloc bloc) => Text(
              bloc.state.status.toString(),
            )),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.read<NotificationsBloc>().requestPermission();
              })
        ],
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
