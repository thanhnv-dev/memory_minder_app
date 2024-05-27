import 'package:memory_minder_app/config/app_configs.dart';

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

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return AppConfigs.productionUrl;
      case Flavor.dev:
        return AppConfigs.localUrl;
      default:
        return AppConfigs.productionUrl;
    }
  }
}
