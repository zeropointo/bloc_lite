part of 'bloc_lite.dart';

typedef BlocStateBuilder<StateT> = Widget Function(
    BuildContext context, StateT state);

class BlocBuilder<BlocT> extends StatelessWidget {
  const BlocBuilder({Key? key, required this.context, required this.builder})
      : super(key: key);

  final BuildContext context;
  final BlocStateBuilder builder;

  @override
  Widget build(BuildContext context) {
    Bloc bloc = ObjectProvider.of<BlocT>(context).object;

    return StreamBuilder<BlocState>(
        stream: bloc.stateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;

          return builder(context, state);
        });
  }
}
