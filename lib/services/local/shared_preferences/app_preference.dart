import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfc/services/local/shared_preferences/app_preference_keys.dart';
import 'package:tfc/utils/logger_utils.dart';

class AppPreferences {
  late final SharedPreferences _store;

  AppPreferences._internal();

  static final AppPreferences instance = AppPreferences._internal();

  Future<bool> init() {
    try {
      return SharedPreferences.getInstance()
          .then((value) => _store = value)
          .then((value) => true);
    } catch (e) {
      return Future(() => false);
    }
  }

  T? get<T>(AppPreferenceKey key, {T? defValue}) {
    try {
      final result = _store.get(key.value);
      return (result as T);
    } catch (e) {
      return defValue;
    }
  }

  Future<bool> set<T>(AppPreferenceKey key, T value) async {
    try {
      switch (T.runtimeType) {
        case int:
          return await _store.setInt(key.value, value as int);
        case bool:
          return await _store.setBool(key.value, value as bool);
        case double:
          return await _store.setDouble(key.value, value as double);
        case String:
          return await _store.setString(key.value, value as String);
        case List<String>:
          return await _store.setStringList(key.value, value as List<String>);
        default:
          return await _store.setString(key.value, jsonEncode(value));
      }
    } catch (e) {
      LoggerUtils.logger.e(e);
      return true;
    }
  }

  clear(AppPreferenceKey key) async => _store.remove(key.value);

  clearAll() async => _store.clear();
}
