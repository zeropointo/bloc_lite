import 'package:flutter/widgets.dart';

class BlocProvider<BlocT> extends InheritedWidget {
  const BlocProvider({
    Key? key,
    required this.bloc,
    required Widget child,
  }) : super(key: key, child: child);

  final BlocT bloc;

  static BlocProvider of<BlocT>(BuildContext context) {
    final BlocProvider? result =
        context.dependOnInheritedWidgetOfExactType<BlocProvider<BlocT>>();

    assert(result != null, 'No ${BlocT.toString()} found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) => bloc != oldWidget.bloc;
}
