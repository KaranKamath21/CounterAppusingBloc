import 'package:bloc_test/bloc_test.dart';
import 'package:first/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: true));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when it increments the state',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when it decrements the state',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
