import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  static const name = '/details';
  final String pushMessageId;
  const DetailsScreen({required this.pushMessageId, super.key});

  @override
  Widget build(BuildContext context) {
    final pushMessage =
        context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Details'),
      ),
      body: pushMessage != null
          ? _DetailsView(
              message: pushMessage,
            )
          : const Center(child: Text('Message not found')),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage message;

  const _DetailsView({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          if (message.imageUrl != null)
            Center(child: Image.network(message.imageUrl!)),
          const SizedBox(height: 10),
          Text(message.title, style: textStyles.titleMedium),
          Text(message.body, style: textStyles.bodyMedium),
          const Divider(),
          Text(message.data.toString(), style: textStyles.bodyMedium),
        ],
      ),
    );
  }
}
