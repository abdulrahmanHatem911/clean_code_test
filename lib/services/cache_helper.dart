import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// فئة مساعدة للتعامل مع التخزين المحلي باستخدام SharedPreferences
class CacheHelper {
  static SharedPreferences? sharedPreferences;

  /// تهيئة الفئة والحصول على مثيل من SharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// حفظ البيانات المختلفة في التخزين المحلي
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences?.setString(key, value) ?? false;
    }
    if (value is int) {
      return await sharedPreferences?.setInt(key, value) ?? false;
    }
    if (value is double) {
      return await sharedPreferences?.setDouble(key, value) ?? false;
    }
    if (value is bool) {
      return await sharedPreferences?.setBool(key, value) ?? false;
    }
    if (value is List<String>) {
      return await sharedPreferences?.setStringList(key, value) ?? false;
    }
    // إذا كانت القيمة كائن أو مصفوفة معقدة، نحولها إلى JSON
    if (value is Map || value is List) {
      String jsonString = jsonEncode(value);
      return await sharedPreferences?.setString(key, jsonString) ?? false;
    }
    return false;
  }

  /// الحصول على البيانات من التخزين المحلي
  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  /// استرجاع البيانات المخزنة كـ JSON وتحويلها إلى كائن
  static dynamic getJsonData({required String key}) {
    String? jsonString = sharedPreferences?.getString(key);
    if (jsonString == null) return null;
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      print('Error decoding JSON: $e');
      return null;
    }
  }

  /// الحصول على قائمة من النصوص
  static List<String>? getStringList({required String key}) {
    return sharedPreferences?.getStringList(key);
  }

  /// حذف بيانات معينة من التخزين المحلي
  static Future<bool> removeData(String key) async {
    return await sharedPreferences?.remove(key) ?? false;
  }

  /// مسح جميع البيانات المخزنة محلياً
  static Future<bool> clearAll() async {
    return await sharedPreferences?.clear() ?? false;
  }

  /// التحقق من وجود مفتاح معين في التخزين المحلي
  static bool containsKey(String key) {
    return sharedPreferences?.containsKey(key) ?? false;
  }

  /// الحصول على جميع المفاتيح المخزنة
  static Set<String> getKeys() {
    return sharedPreferences?.getKeys() ?? <String>{};
  }
}
