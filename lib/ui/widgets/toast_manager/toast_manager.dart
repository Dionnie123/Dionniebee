import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager extends StatefulWidget {
  final Widget child;
  const ToastManager({super.key, required this.child});

  @override
  _ToastManagerState createState() => _ToastManagerState();
}

class _ToastManagerState extends State<ToastManager> {
  final ToastService _toastService = locator<ToastService>();
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _toastService.registerDialogListener(_showToast);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showToast() {
    fToast.showToast(
      child: const Text("FUCKKK!!"),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
