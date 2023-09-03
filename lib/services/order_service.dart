import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';

class OrderService extends ReactiveViewModel {
  final StreamController<num> _numController = BehaviorSubject();
  Stream<num> get getNumStream => _numController.stream;
  bool _isStreaming = false;

  late StreamSubscription<num> _timerSubscription;

  OrderService() {
    _timerSubscription = getNumStream.listen((event) {
      _numController.add(event);
    });
  }

  void startStream(num start) {
    if (!_isStreaming) {
      _isStreaming = true;
      notifyListeners();
      _emitNumbers(start);
    }
  }

  void pauseStream() {
    _isStreaming = false;
    notifyListeners();
  }

  void restartStream() {
    _numController.add(0);
    _isStreaming = true;
    startStream(0);
    notifyListeners();
  }

  void stopStream() {
    _isStreaming = false;

    notifyListeners();
    _numController.done;
  }

  Stream<num> emit(num start) async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield start += 1;
    }
  }

  void _emitNumbers(num start) async {
    while (_isStreaming) {
      await Future.delayed(const Duration(seconds: 1));
      if (_isStreaming) {
        _numController.add(start += 1);
      }
    }
  }
}
