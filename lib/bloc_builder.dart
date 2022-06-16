import 'package:flutter/widgets.dart';

import 'bloc_lite.dart';
import 'bloc_provider.dart';

typedef BlocStateBuilder<StateT> = Widget Function(
    BuildContext context, StateT state);

abstract class BlocBuilder extends StatelessWidget {
  const BlocBuilder({Key? key, required this.context, required this.builder})
      : super(key: key);

  final BuildContext context;
  final BlocStateBuilder builder;

  @override
  Widget build(BuildContext context) {
    Bloc bloc = BlocProvider.of(context).bloc;

    return StreamBuilder<BlocState>(
        stream: bloc.stateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;

          return builder(context, state);
        });
  }
}
