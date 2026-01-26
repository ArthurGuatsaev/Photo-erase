import 'package:shared_preferences/shared_preferences.dart';

mixin WorkingPreferences {
  final _appOpenKey = '_applicationOpenKey';

  SharedPreferences? _shared;
  Future<SharedPreferences> get shared async =>
      _shared ?? await SharedPreferences.getInstance();

  late final int applicationOpenCount;
  Future<void> getApplicationOpenCount() async {
    applicationOpenCount = (await shared).getInt(_appOpenKey) ?? 0;
    (await shared).setInt(_appOpenKey, applicationOpenCount + 1);
  }
}
