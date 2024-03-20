import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class SharedPreferencesLocalStorageService implements LocalStorageService {
  @override
  final bool enableLogs;
  SharedPreferencesLocalStorageService({this.enableLogs = false});
  final _log = getLogger('SharedPreferencesService');
  late SharedPreferences _preferences;

  @override
  Future<void> init() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      _log.i('Initialized');
    } catch (e) {
      _log.e('Initialized Failed');
    }
  }

  @override
  Set<String> getKeys() => _preferences.getKeys();

  @override
  Object? getFromDisk(String key) {
    final value = _preferences.get(key);
    if (enableLogs) _log.v('key:$key value:$value');
    return value;
  }

  @override
  void saveToDisk(String key, dynamic content) {
    if (enableLogs) _log.v('key:$key value:$content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  @override
  void dispose() {
    _log.i('dispose');
    _preferences.clear();
  }
}
