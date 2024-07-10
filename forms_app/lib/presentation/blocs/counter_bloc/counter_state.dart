part of 'counter_bloc.dart';

class CounterBlocState extends Equatable {
  final int counter;
  final int transactionCount;
  const CounterBlocState({
    this.counter = 10,
    this.transactionCount = 0,
  });

  CounterBlocState copyWith({
    int? counter,
    int? transactionCount,
  }) {
    return CounterBlocState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }

  @override
  List<Object> get props => [counter, transactionCount];
}
