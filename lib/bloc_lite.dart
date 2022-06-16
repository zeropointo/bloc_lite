library bloc_lite;

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/widgets.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';
part 'bloc_provider.dart';
part 'bloc_builder.dart';

typedef OnEvent = Future<void> Function(BlocEvent event);

/// Bloc consuming events and producing states.
abstract class Bloc {
  Bloc({required BlocState initialState}) {
    _stateOutputStream = BehaviorSubject<BlocState>.seeded(initialState);
    _eventInputStream.stream.listen(_mapEventToHandler);
  }

  final Map<Type, OnEvent> _handlers = {};

  // Input
  final _eventInputStream = StreamController<BlocEvent>();
  Sink<BlocEvent> get eventSink => _eventInputStream.sink;

  // Output
  late BehaviorSubject<BlocState> _stateOutputStream;
  Stream<BlocState> get stateStream => _stateOutputStream.stream;

  // Handler
  Future<void> _mapEventToHandler(BlocEvent event) async {
    Type type = event.runtimeType;
    if (_handlers.containsKey(type)) {
      OnEvent foo = _handlers[type] as OnEvent;
      await foo(event);
    }
  }

  // Set event handler
  void on(Type event, OnEvent handler) {
    _handlers[event] = handler;
  }

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
