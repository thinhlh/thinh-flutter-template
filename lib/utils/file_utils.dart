import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

abstract class FileUtils {
  /// Load JSON from resource
  static Future<dynamic> loadJson(String path) async {
    String content = await rootBundle.loadString(path);
    return jsonDecode(content);
  }
}
