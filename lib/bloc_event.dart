part of 'bloc_lite.dart';

/// Abstraction representing an event recieved by the Bloc.
abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}
