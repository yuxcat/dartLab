import 'package:flutter/cupertino.dart';
import 'package:flutter_stream_state_inherited/services/notify.dart';

class AppState extends InheritedWidget {
  const AppState({
    super.key,
    required Widget child,
    required this.notify,
  }) : super(child: child);

  final Notify notify;

  static AppState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppState>();

  // static AppState of(BuildContext context) {
  //   final AppState? result =
  //       context.dependOnInheritedWidgetOfExactType<AppState>();
  //   assert(result != null, 'No AppState found in context');
  //   return result!;
  // }

  @override
  bool updateShouldNotify(covariant AppState oldWidget) =>
      notify != oldWidget.notify;
}
