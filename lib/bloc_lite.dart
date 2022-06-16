library bloc_lite;

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

/// Bloc consuming events and producing states.
abstract class Bloc {
  Bloc({required BlocState initialState}) {
    _stateOutputStream = BehaviorSubject<BlocState>.seeded(initialState);
    _eventInputStream.stream.listen(mapEventToState);
  }

  // Input
  final _eventInputStream = StreamController<BlocEvent>();
  Sink<BlocEvent> get eventSink => _eventInputStream.sink;

  // Output
  late BehaviorSubject<BlocState> _stateOutputStream;
  Stream<BlocState> get stateStream => _stateOutputStream.stream;

  // Handler
  Future<void> mapEventToState(BlocEvent event);

  // Add event
  void add(BlocEvent event) {
    _eventInputStream.sink.add(event);
  }

  // Emit state
  void emit(BlocState state) {
    _stateOutputStream.add(state);
  }

  // Clean up
  void dispose() {
    _stateOutputStream.close();
    _eventInputStream.close();
  }
}
