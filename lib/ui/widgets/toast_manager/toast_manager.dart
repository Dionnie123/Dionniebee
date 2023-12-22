import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager extends StatefulWidget {
  final Widget child;
  const ToastManager({super.key, required this.child});

  @override
  State<ToastManager> createState() => _ToastManagerState();
}

class _ToastManagerState extends State<ToastManager> {
  final ToastService _toastService = locator<ToastService>();
  late FToast fToast;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);

    showToast(String? message) {
      fToast.showToast(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.black.withOpacity(0.8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check, color: Colors.white),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  message.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          fadeDuration: const Duration(milliseconds: 500),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 2));
    }

    _toastService.showToast = showToast;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
