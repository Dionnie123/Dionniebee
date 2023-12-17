import 'dart:async';

class ToastService {
  late Function _showDialogListener;
  Completer? _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future showDialog({Duration duration = const Duration(seconds: 5)}) {
    _dialogCompleter = Completer();
    _showDialogListener();

    // Completing the dialogCompleter after a certain duration
    Future.delayed(duration, () {
      dialogComplete();
    });

    return _dialogCompleter != null
        ? _dialogCompleter!.future
        : Future.value(null);
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete() {
    _dialogCompleter?.complete();
    _dialogCompleter = null;
  }
}
