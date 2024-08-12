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
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<NotificationsBloc>().state.notifications;

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final message = notifications[index];
        return ListTile(
          leading: message.imageUrl != null
              ? Image.network(message.imageUrl!)
              : Icon(Icons.notifications),
          title: Text(message.title),
          subtitle: Text(message.body),
        );
      },
    );
  }
}
