import 'dart:async';

class Notify<T> {
  Notify();

  final _controller = StreamController<T>();
  StreamController<T> get controller => _controller;

  Stream<T> get stream => _controller.stream;
  set stream(data) => _controller.sink.add(data);

  void notify(T data) => stream = data;

  // DEBUG
  // void notify(T data) {
  //   print("transmitted Data :  $data");
  //   _controller.sink.add(data);
  // }

  Stream<T> flow() => stream;
}
