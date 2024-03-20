import 'package:stacked/stacked_annotations.dart';

abstract class LocalStorageService
    with InitializableDependency
    implements InitializableDependency {
  bool get enableLogs;
  Set<String> getKeys();
  Object? getFromDisk(String key);
  void saveToDisk(String key, dynamic content);
  void dispose();
}
