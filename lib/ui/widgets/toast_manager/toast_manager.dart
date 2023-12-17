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

  Future<void> _showToast() async {
    fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.black.withOpacity(0.8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check, color: Colors.white),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "This is a Custom Toast",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        fadeDuration: const Duration(milliseconds: 500),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2));
  }
}
