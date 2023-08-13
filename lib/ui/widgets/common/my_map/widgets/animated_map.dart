import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';

class AnimatedMap extends StatefulWidget {
  final Function() onPop;
  final Widget Function(BuildContext context, AnimatedMapController controller)
      builder;
  const AnimatedMap({super.key, required this.builder, required this.onPop});

  @override
  State<AnimatedMap> createState() => _AnimatedMapState();
}

class _AnimatedMapState extends State<AnimatedMap>
    with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);

  @override
  void dispose() {
    () => widget.onPop();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _animatedMapController);
  }
}
