import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stream_state/models/models.dart';

class CounterContainer extends StatefulWidget {
  const CounterContainer({super.key, required this.callBack});

  final OnIncrementCallback callBack;

  @override
  State<CounterContainer> createState() => _CounterContainerState();
}

class _CounterContainerState extends State<CounterContainer> {
  Counter count = Counter(0);

  final StreamController<Counter> _streamController = StreamController();
  late Stream<Counter> stream;

  @override
  void initState() {
    super.initState();

    _streamController.add(count);
    stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Counter>(
        initialData: count,
        stream: stream,
        builder: (context, AsyncSnapshot<Counter> snapshot) {
          widget.callBack.call(() => _onincrement());
          return Text(snapshot.data!.count.toString());
        });
  }

  void _onincrement() async {
    count.count++;
    _streamController.add(count);
  }
}
