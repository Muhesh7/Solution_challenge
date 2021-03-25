import 'package:meta/meta.dart';

enum Flavor { Owner, Customer }

class FlavorValues {
  final String name;
  FlavorValues(this.name);
}

class FlavorConfig {
  final FlavorValues flavorValues;
  final Flavor flavor;

  static FlavorConfig _instance;

  factory FlavorConfig({
    @required FlavorValues flavorValues,
    @required Flavor flavor,
  }) {
    _instance ??= FlavorConfig._initialize(flavorValues, flavor);
    return _instance;
  }

  FlavorConfig._initialize(this.flavorValues, this.flavor);
  // static FlavorConfig get instance {
  //   return _instance;
  // }

  // static bool isOwner() => _instance.flavor == Flavor.Owner;
  // static bool isDevelopment() => _instance.flavor == Flavor.Customer;
}
