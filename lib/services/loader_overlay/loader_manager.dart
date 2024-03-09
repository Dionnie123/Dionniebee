import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/loader_overlay/loader_service.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderOverlayManager extends StatefulWidget {
  final Widget child;
  const LoaderOverlayManager({super.key, required this.child});

  @override
  State<LoaderOverlayManager> createState() => _LoaderOverlayManagerState();
}

class _LoaderOverlayManagerState extends State<LoaderOverlayManager> {
  final LoaderOverlayService _loaderService = locator<LoaderOverlayService>();

  @override
  void initState() {
    hideLoaderOverlay() {
      context.loaderOverlay.hide();
    }

    showLoaderOverlay() {
      context.loaderOverlay.show();
    }

    Map<LoaderOverlayType, LoaderOverlayBuilder> customBuilders = {
      LoaderOverlayType.show: () => showLoaderOverlay(),
    };

    _loaderService.hideLoaderOverlay = () => hideLoaderOverlay();
    _loaderService.registerCustomLoaderOverlayBuilders(customBuilders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(child: widget.child);
  }
}
