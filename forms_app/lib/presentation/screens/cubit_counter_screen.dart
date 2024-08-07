import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CubitCounterView(),
    );
  }
}

class CubitCounterView extends StatelessWidget {
  const CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void increaseBy(int value) {
      context.read<CounterCubit>().incrementBy(value);
    }

    void reset() {
      context.read<CounterCubit>().reset();
    }

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit cubit) =>
            Text('Counter Counter:  ${cubit.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () {
              reset();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          print("CubitCounterView");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseBy(3),
            heroTag: '3',
            child: const Text('+3'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => increaseBy(2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => increaseBy(1),
            heroTag: '1',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
