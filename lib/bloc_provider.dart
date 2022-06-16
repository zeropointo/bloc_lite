import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'bloc_lite.dart';

/// Provides a bloc to it's decendants.
abstract class BlocProvider<BlocT> extends Provider {
  BlocProvider(
    Key? key, {
    required this.bloc,
    required Widget child,
  }) : super();

  final BlocT bloc;

  static BlocT of<T extends Bloc>(BuildContext context) {
    final BlocProvider? result = Provider.of<BlocT>(context) as BlocProvider?;
    return result!;
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) => bloc != oldWidget.bloc;
}
