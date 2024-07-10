import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlockCounterView(),
    );
  }
}

class _BlockCounterView extends StatelessWidget {
  const _BlockCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, int value) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(const ResetCounter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<CounterBloc, CounterState, String>(
          selector: (state) {
            return state.counter.toString();
          },
          builder: (context, state) {
            print('Rebuilding');
            return Text('BLoC Counter $state');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              resetCounter(context);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter'),
            const SizedBox(height: 16),
            context.select(
              (CounterBloc bloc) => Text(
                bloc.state.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, 3);
            },
            heroTag: '3',
            child: const Text('+3'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, 2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, 1);
            },
            heroTag: '1',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
