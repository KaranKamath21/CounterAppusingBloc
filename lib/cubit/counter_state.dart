part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}