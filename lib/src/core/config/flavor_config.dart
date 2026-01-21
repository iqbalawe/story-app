enum FlavorType { free, paid }

class FlavorConfig {
  FlavorConfig({required this.flavor, required this.appName}) {
    _instance = this;
  }

  final FlavorType flavor;
  final String appName;

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    return _instance ??
        FlavorConfig(flavor: FlavorType.free, appName: 'Story Free');
  }

  static bool get isPaid => _instance?.flavor == FlavorType.paid;
  static bool get isFree => _instance?.flavor == FlavorType.free;
}
