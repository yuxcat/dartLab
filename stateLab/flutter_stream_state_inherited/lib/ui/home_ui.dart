import 'package:flutter/material.dart';
import 'package:flutter_stream_state_inherited/containers/counter_container.dart';
import 'package:flutter_stream_state_inherited/models/state_model.dart';
import 'package:flutter_stream_state_inherited/state/app_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppStateModel model = AppStateModel(Brightness.dark);

  @override
  Widget build(BuildContext context) {
    late void Function() onIncrement;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            CounterContainer(
                callBack: (void Function() method) => onIncrement = method),
            TextButton(
                onPressed: () => _changeTheme(),
                child: const Text("Change Theme"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onIncrement.call(),
      ),
    );
  }

  void _changeTheme() {
    model.current = Brightness.dark;

    AppState.of(context)?.notify.notify(model);

    // final stream = AppState.of(context)?.notify.flow();

    // stream?.listen((event) {
    //   String current = event.current.toString();
    //   String prev = model.current.toString();

    //   //
    //   model.current = Brightness.light;
    //   AppState.of(context)?.notify.notify(model);
    // });
  }
}
