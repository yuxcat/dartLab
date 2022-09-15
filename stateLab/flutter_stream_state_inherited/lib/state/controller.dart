import 'package:flutter/material.dart';
import 'package:flutter_stream_state_inherited/app.dart';
import 'package:flutter_stream_state_inherited/models/state_model.dart';
import 'package:flutter_stream_state_inherited/services/notify.dart';
import 'package:flutter_stream_state_inherited/state/app_state.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  Notify<AppStateModel> notify = Notify();
  final AppStateModel model = AppStateModel(Brightness.light);

  @override
  Widget build(BuildContext context) {
    return AppState(
      notify: notify,
      child: const App(),
    );
  }
}
