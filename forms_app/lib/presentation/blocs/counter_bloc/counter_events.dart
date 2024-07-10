part of 'counter_bloc.dart';

// sealed class CounterEvent extends Equatable {
sealed class CounterEvent {
  const CounterEvent();

  // @override
  // List<Object> get props => [];
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);

  // @override
  // List<Object> get props => [value];
}

class ResetCounter extends CounterEvent {
  const ResetCounter();
}
