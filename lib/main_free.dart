import 'package:story_app/main.dart' as runner;
import 'package:story_app/src/core/config/flavor_config.dart';

void main() {
  FlavorConfig(flavor: FlavorType.free, appName: 'Story App Free');
  runner.main();
}
