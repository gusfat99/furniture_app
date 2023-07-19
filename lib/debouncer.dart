import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final int seconds;
  Debouncer({required this.seconds});

  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(seconds: seconds), action);
  }
}
