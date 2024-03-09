import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/loader_overlay_contextless/loader_service.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderManager extends StatefulWidget {
  final Widget child;
  const LoaderManager({super.key, required this.child});

  @override
  State<LoaderManager> createState() => _LoaderManagerState();
}

class _LoaderManagerState extends State<LoaderManager> {
  final LoaderService _loaderService = locator<LoaderService>();

  @override
  void initState() {
    hideLoader() {
      context.loaderOverlay.hide();
    }

    showLoader() {
      context.loaderOverlay.show();
    }

    Map<LoaderType, LoaderBuilder> customBuilders = {
      LoaderType.show: () => showLoader(),
    };

    _loaderService.hideLoader = () => hideLoader();
    _loaderService.registerCustomLoaderBuilders(customBuilders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(child: widget.child);
  }
}
