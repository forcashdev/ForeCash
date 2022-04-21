import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelManager {
  static Mixpanel? _instance;
  static Future<Mixpanel> init() async {
    _instance ??= await Mixpanel.init("90e2c0fcc8008065ffd6865948a75a0d", optOutTrackingDefault: false);
    return _instance!;
  }
}
