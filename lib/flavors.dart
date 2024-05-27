enum Flavor {
  production,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Memory Minder';
      case Flavor.dev:
        return 'Memory Minder Dev';
      default:
        return 'title';
    }
  }

}
