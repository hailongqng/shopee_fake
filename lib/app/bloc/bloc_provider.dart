import 'package:flutter/widgets.dart';

abstract class Bloc {
  void dispose();
}

typedef BlocBuilder<T> = T Function();
typedef BlocDisposer<T> = Function(T);

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final BlocBuilder<T> blocBuilder;
  final BlocDisposer<T>? blocDispose;

  const BlocProvider({
    Key? key,
    required this.child,
    required this.blocBuilder,
    this.blocDispose,
  }) : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    var provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited<T>;
    return provider.bloc;
  }

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  late T bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.blocBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited(bloc: bloc, child: widget.child);
  }

  @override
  void dispose() {
    if (widget.blocDispose != null) {
      widget.blocDispose!(bloc);
    } else {
      bloc.dispose();
    }
    super.dispose();
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  final T bloc;

  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
