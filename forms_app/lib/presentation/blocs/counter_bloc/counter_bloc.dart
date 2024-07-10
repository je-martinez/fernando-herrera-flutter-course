import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_events.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(const CounterBlocState()) {
    on<CounterIncreased>(_onIncreased);
    on<ResetCounter>(_onReset);
  }

  //Events
  void increaseBy(int value) => add(CounterIncreased(value));
  void reset() => add(const ResetCounter());

  void _onIncreased(CounterIncreased event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onReset(ResetCounter event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(counter: 0));
  }
}
