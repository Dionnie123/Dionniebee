import 'dart:async';

class ToastService {
  Function? _showDialogListener;
  Completer? _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future showDialog() async {
    return _showDialogListener!();
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete() {
    _dialogCompleter?.complete();
    _dialogCompleter = null;
  }
}
