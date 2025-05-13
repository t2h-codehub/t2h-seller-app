enum Flavor {
  socioshop,
  socioshoptest,
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String apiBaseUrl;
  final String domainName;
  final String storeUrl;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required String apiBaseUrl,
    required String domainName,
    required String storeUrl,
  }) {
    _instance = FlavorConfig._internal(flavor, name, apiBaseUrl, domainName, storeUrl);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.apiBaseUrl, this.domainName, this.storeUrl);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.socioshop;
  static bool isTest() => _instance?.flavor == Flavor.socioshoptest;

  // Static getters for URLs with different names
  static String get currentBaseUrl => instance.apiBaseUrl;
  static String get currentDomain => instance.domainName;
  static String get currentStoreUrl => instance.storeUrl;
} 