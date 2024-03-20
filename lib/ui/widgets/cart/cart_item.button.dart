import 'package:dionniebee/ui/common/colors.dart';
import 'package:flutter/material.dart';

/// A round button with an icon that can be tapped or held
/// Tapping the button once simply calls [onUpdate], holding
/// the button will repeatedly call [onUpdate] with a
/// decreasing time interval.
class CartItemButton extends StatefulWidget {
  /// Update callback
  final VoidCallback onUpdate;

  /// Minimum delay between update events when holding the button
  final int minDelay;

  /// Initial delay between change events when holding the button
  final int initialDelay;

  /// Number of steps to go from [initialDelay] to [minDelay]
  final int delaySteps;

  /// Icon on the button
  final IconData icon;

  const CartItemButton(
      {super.key,
      required this.onUpdate,
      this.minDelay = 80,
      this.initialDelay = 300,
      this.delaySteps = 5,
      required this.icon})
      : assert(minDelay <= initialDelay,
            "The minimum delay cannot be larger than the initial delay");

  @override
  State<CartItemButton> createState() => _CartItemButtonState();
}

class _CartItemButtonState extends State<CartItemButton> {
  /// True if the button is currently being held
  bool _holding = false;

  int _tapDownCount = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(0),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: kcDark,
        child: InkWell(
          onTap: () => _stopHolding(),
          onTapDown: (_) => _startHolding(),
          onTapCancel: () => _stopHolding(),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              widget.icon,
              size: 16,
              color: Colors.white,
            ),
          ),
        ));
  }

  void _startHolding() async {
    // Make sure this isn't called more than once for
    // whatever reason.
    widget.onUpdate();
    _tapDownCount += 1;
    final int myCount = _tapDownCount;
    if (_holding) return;
    _holding = true;

    // Calculate the delay decrease per step
    final step =
        (widget.initialDelay - widget.minDelay).toDouble() / widget.delaySteps;
    var delay = widget.initialDelay.toDouble();

    while (true) {
      await Future.delayed(Duration(milliseconds: delay.round()));
      if (_holding && myCount == _tapDownCount) {
        widget.onUpdate();
      } else {
        return;
      }
      if (delay > widget.minDelay) delay -= step;
    }
  }

  void _stopHolding() {
    _holding = false;
  }
}
