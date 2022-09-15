import 'package:flutter/material.dart';
import 'package:flutter_stream_state_inherited/models/models.dart';
import 'package:flutter_stream_state_inherited/services/notify.dart';

class CounterContainer extends StatefulWidget {
  const CounterContainer({super.key, required this.callBack});

  final OnIncrementCallback callBack;

  @override
  State<CounterContainer> createState() => _CounterContainerState();
}

class _CounterContainerState extends State<CounterContainer> {
  final Counter counter = Counter(0);
  final Notify<Counter> _state = Notify();

  @override
  void initState() {
    super.initState();
    _state.notify(counter);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: counter,
        stream: _state.flow(),
        builder: (context, AsyncSnapshot snapshot) {
          widget.callBack.call(() => _onincrement());
          return Text(snapshot.data!.count.toString());
        });
  }

  void _onincrement() async {
    counter.count++;
    _state.notify(counter);
  }
}
