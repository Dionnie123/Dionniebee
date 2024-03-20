enum LoaderOverlayType { show }

typedef LoaderOverlayBuilder = Function();

typedef LoaderOverlayBuilderType = Map<LoaderOverlayType, LoaderOverlayBuilder>;

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
