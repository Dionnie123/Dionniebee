enum LoaderType { show, hide }

typedef LoaderBuilder = Function();

class LoaderService {
  Map<LoaderType, LoaderBuilder> _loaderBuilders =
      <LoaderType, LoaderBuilder>{};
  void registerCustomLoaderBuilders(Map<LoaderType, LoaderBuilder> builders) {
    _loaderBuilders = builders;
  }

  show(LoaderType type) {
    return _loaderBuilders[LoaderType.show]?.call();
  }

  hide() {
    return _loaderBuilders[LoaderType.hide]?.call();
  }
}
