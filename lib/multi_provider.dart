part of 'bloc_lite.dart';

class MultiProvider<ObjectT> extends InheritedWidget {
  const MultiProvider({
    Key? key,
    required this.objectList,
    required Widget child,
  }) : super(key: key, child: child);

  final List<ObjectT> objectList;

  static MultiProvider of<ObjectT>(BuildContext context) {
    final MultiProvider? result =
        context.dependOnInheritedWidgetOfExactType<MultiProvider<ObjectT>>();

    assert(result != null, 'No ${ObjectT.toString()} found in context');

    return result!;
  }

  T? object<T>() {
    T? result;

    for (ObjectT o in objectList) {
      if (o.runtimeType == T) {
        result = o as T;
        break;
      }
    }

    return result;
  }

  @override
  bool updateShouldNotify(MultiProvider oldWidget) =>
      objectList != oldWidget.objectList;
}
