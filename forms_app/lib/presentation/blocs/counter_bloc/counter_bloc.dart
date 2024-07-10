import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_events.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onIncreased);
    on<ResetCounter>(_onReset);
  }

  void _onIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + event.value));
  }

  void _onReset(ResetCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }
}
