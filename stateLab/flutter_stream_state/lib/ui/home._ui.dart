import 'package:flutter/material.dart';
import 'package:flutter_stream_state/containers/counter_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    late void Function() onIncrement;

    return Scaffold(
      body: Center(
        child: CounterContainer(
            callBack: (void Function() method) => onIncrement = method),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onIncrement.call(),
      ),
    );
  }
}
