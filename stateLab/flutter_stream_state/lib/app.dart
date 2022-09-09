import 'package:flutter/material.dart';
import 'package:flutter_stream_state/ui/home._ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
