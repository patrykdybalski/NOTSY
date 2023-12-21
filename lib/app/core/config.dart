enum Flavor {
  develpoment,
  production,
}

class Config {
  static Flavor appFlavor = Flavor.production;

  static String get configMessage {
    switch (appFlavor) {
      case Flavor.develpoment:
        return 'Developers version';
      case Flavor.production:
        return 'Production version';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.develpoment:
        return 'http://api.weatherapi.com/v1/';
      case Flavor.production:
        return 'http://api.weatherapi.com/v1/';
    }
  }

  static bool get debugShowCheckedModeBanner {
    switch (appFlavor) {
      case Flavor.develpoment:
        return true;
      case Flavor.production:
        return false;
    }
  }
}
