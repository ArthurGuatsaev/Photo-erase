import 'package:shared_preferences/shared_preferences.dart';

mixin WorkingPreferences {
  final _appOpenKey = '_applicationOpenKey';
  final _attKey = '_attKey';
  final _ratingKey = '_ratingKey';

  late final int applicationOpenCount;
  late bool needAtt;
  late bool needRating;

  SharedPreferences? _shared;
  Future<SharedPreferences> get shared async =>
      _shared ?? await SharedPreferences.getInstance();

  Future<void> getApplicationOpenCount() async {
    applicationOpenCount = (await shared).getInt(_appOpenKey) ?? 0;
    (await shared).setInt(_appOpenKey, applicationOpenCount + 1);
  }

  Future<void> getNeedAttRequest() async {
    needAtt = (await shared).getBool(_attKey) ?? true;
    (await shared).setBool(_attKey, false);
  }

  Future<void> getNeedRating() async {
    needRating = (await shared).getBool(_ratingKey) ?? true;
    (await shared).setBool(_ratingKey, false);
  }
}
