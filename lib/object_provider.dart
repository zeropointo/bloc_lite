part of 'bloc_lite.dart';

class ObjectProvider<ObjectT> extends InheritedWidget {
  const ObjectProvider({
    Key? key,
    required this.object,
    required Widget child,
  }) : super(key: key, child: child);

  final ObjectT object;

  static ObjectProvider of<ObjectT>(BuildContext context) {
    final ObjectProvider? result =
        context.dependOnInheritedWidgetOfExactType<ObjectProvider<ObjectT>>();

    assert(result != null, 'No ${ObjectT.toString()} found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(ObjectProvider oldWidget) =>
      object != oldWidget.object;
}
