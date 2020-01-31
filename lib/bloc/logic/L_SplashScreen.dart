import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  final _timer = BehaviorSubject<bool>();

  Function(bool) get updateTimer => _timer.sink.add;
  Stream<bool> get getTimer => _timer.stream;

  startTimer() async {
    await Future.delayed(Duration(seconds: 2));
    updateTimer(true);
  }

  @mustCallSuper
  void dispose() {
    _timer.close();
  }
}

final bloc = Bloc();
