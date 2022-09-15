import 'package:flutter/material.dart';
import 'package:flutter_stream_state_inherited/models/state_model.dart';
import 'package:flutter_stream_state_inherited/state/app_state.dart';
import 'package:flutter_stream_state_inherited/ui/home_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: AppStateModel(Brightness.light),
      stream: AppState.of(context)?.notify.flow(),
      builder: (context, AsyncSnapshot snapshot) => MaterialApp(
        home: const Home(),
        theme: ThemeData(brightness: snapshot.data.current),
      ),
    );
  }
}
