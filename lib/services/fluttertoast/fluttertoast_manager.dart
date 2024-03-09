import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/fluttertoast/fluttertoast_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastManager extends StatelessWidget {
  final Widget? child;
  const FlutterToastManager({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (contextx) => FlutterToastWidget(child: child),
        ),
      ],
    );
  }
}

class FlutterToastWidget extends StatefulWidget {
  final Widget? child;
  const FlutterToastWidget({super.key, required this.child});

  @override
  State<FlutterToastWidget> createState() => _FlutterToastWidgetState();
}

class _FlutterToastWidgetState extends State<FlutterToastWidget> {
  final FlutterToastService _toastService = locator<FlutterToastService>();
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

    welcomeToast() {
      fToast.showToast(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
                  "Welcome",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          fadeDuration: const Duration(milliseconds: 500),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 2));
    }

    _toastService.welcomeToast = welcomeToast;
    _toastService.showToast = showToast;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: widget.child);
  }
}
