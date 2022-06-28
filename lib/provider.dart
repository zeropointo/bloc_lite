part of 'bloc_lite.dart';

class Provider<ObjectT> extends InheritedWidget {
  const Provider({
    Key? key,
    required this.object,
    required Widget child,
  }) : super(key: key, child: child);

  final ObjectT object;

  static Provider of<ObjectT>(BuildContext context) {
    final Provider? result =
        context.dependOnInheritedWidgetOfExactType<Provider<ObjectT>>();

    assert(result != null, 'No ${ObjectT.toString()} found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) => object != oldWidget.object;
}
