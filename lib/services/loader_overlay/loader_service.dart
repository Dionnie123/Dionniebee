enum LoaderOverlayType { show }

typedef LoaderOverlayBuilder = Function();

typedef LoaderOverlayBuilderType = Map<LoaderOverlayType, LoaderOverlayBuilder>;

/// Usage: await _loaderService.show(LoaderOverlayType.show);
///  await Future.delayed(const Duration(seconds: 10));
/// _loaderService.hide();
class LoaderOverlayService {
  LoaderOverlayBuilderType _loaderCustomBuilders = {};

  void registerCustomLoaderOverlayBuilders(LoaderOverlayBuilderType builders) {
    _loaderCustomBuilders = builders;
  }

  LoaderOverlayBuilder? hideLoaderOverlay;
  hide() {
    return hideLoaderOverlay?.call();
  }

  show(LoaderOverlayType type) {
    return _loaderCustomBuilders[LoaderOverlayType.show]?.call();
  }
}
