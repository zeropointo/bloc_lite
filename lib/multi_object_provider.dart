part of 'bloc_lite.dart';

class MultiObjectProvider<ObjectT> extends InheritedWidget {
  const MultiObjectProvider({
    Key? key,
    required this.objectList,
    required Widget child,
  }) : super(key: key, child: child);

  final List<ObjectT> objectList;

  static MultiObjectProvider of<ObjectT>(BuildContext context) {
    final MultiObjectProvider? result = context
        .dependOnInheritedWidgetOfExactType<MultiObjectProvider<ObjectT>>();

    assert(result != null, 'No ${ObjectT.toString()} found in context');

    return result!;
  }

  T? object<T>() {
    T? result;

    for (ObjectT o in objectList) {
      print('[DEBUG] o ${o.runtimeType.toString()} T ${T.toString()}');

      if (o.runtimeType is T) {
        result = o as T;
        break;
      }
    }

    return result;
  }

  @override
  bool updateShouldNotify(MultiObjectProvider oldWidget) =>
      objectList != oldWidget.objectList;
}
