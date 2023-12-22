enum LoaderType { show }

typedef LoaderBuilder = Function();

class LoaderService {
  Map<LoaderType, LoaderBuilder> _loaderCustomBuilders =
      <LoaderType, LoaderBuilder>{};

  LoaderBuilder? hideToast;

  void registerCustomLoaderBuilders(Map<LoaderType, LoaderBuilder> builders) {
    _loaderCustomBuilders = builders;
  }

  show(LoaderType type) {
    return _loaderCustomBuilders[LoaderType.show]?.call();
  }

  hide() {
    return hideToast?.call();
  }
}
