import 'package:flutter/material.dart';

class EzButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;

  final void Function() onPressed;
  final void Function()? onLongPress;

  const EzButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    required this.onPressed,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    Widget loading() {
      return const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: disabled
            ? null
            : busy
                ? () {}
                : () => onPressed(),
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: busy
                ? loading()
                : Text(
                    title,
                    style: const TextStyle(fontSize: 15),
                  )),
      ),
    );
  }
}
