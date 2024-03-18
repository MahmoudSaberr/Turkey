import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getBoolean({required String key}) {
    return sharedPreferences.getBool(key) ?? false;
  }

  static dynamic getData({required String key, dynamic defaultValue}) {
    return (sharedPreferences.get(key) ?? defaultValue);
  }

  static int? geInt({required String key, int? defaultValue}) {
    return (sharedPreferences.getInt(key) ?? defaultValue);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> saveUserData({
    required String id,
    required String name,
    required String password,
    required String phone,
    required String country,
    required String userType,
    required String email,
  }) async {
    await sharedPreferences.setBool('isLogged', true);
    await sharedPreferences.setString('name', name);
    await sharedPreferences.setString('password', password);
    await sharedPreferences.setString('phone', phone);
    await sharedPreferences.setString('country', country);
    await sharedPreferences.setString('userType', userType);
    await sharedPreferences.setString('id', id);
    await sharedPreferences.setString('email', email);
  }

  static Future<void> updateLogged({required bool isLogged}) async {
    await sharedPreferences.setBool('isLogged', isLogged);
  }

  static Future<void> updateFontFamily({required String fontFamily}) async {
    await sharedPreferences.setString('fontFamily', fontFamily);
  }

  static Future<void> updateName({required String name}) async {
    await sharedPreferences.setString('name', name);
  }

  static Future<void> updatePhone({required String phone}) async {
    await sharedPreferences.setString('phone', phone);
  }

  static Future<void> updatePassword({required String password}) async {
    await sharedPreferences.setString('password', password);
  }

  static Future<void> updateCountry({required String country}) async {
    await sharedPreferences.setString('country', country);
  }

  static Future<void> updateUserType({required String userType}) async {
    await sharedPreferences.setString('userType', userType);
  }

  static Future<void> updateIntroRead({required bool isIntroRead}) async {
    await sharedPreferences.setBool('isIntroRead', isIntroRead);
  }

  static String get fontFamily {
    return sharedPreferences.getString('fontFamily') ?? '';
  }

  static String get userId {
    return sharedPreferences.getString('id') ?? '';
  }

  static String get userType {
    return sharedPreferences.getString('userType') ?? '';
  }

  static bool get isLogged {
    return sharedPreferences.getBool('isLogged') ?? false;
  }

  static String get appLanguage {
    return sharedPreferences.getString('appLanguage') ?? '';
  }

  static bool get isIntroRead {
    return sharedPreferences.getBool('isIntroRead') ?? false;
  }

  static String get name {
    return sharedPreferences.getString('name') ?? '';
  }

  static String get phone {
    return sharedPreferences.getString('phone') ?? '';
  }

  static String get email {
    return sharedPreferences.getString('email') ?? '';
  }

  static String get password {
    return sharedPreferences.getString('password') ?? '';
  }

  static String get country {
    return sharedPreferences.getString('country') ?? '';
  }

  // static Future<bool> clear() async => sharedPreferences.clear();
  static Future<void> clear() async {
    await sharedPreferences.setBool('isLogged', false);
    await sharedPreferences.setString('name', '');
    await sharedPreferences.setString('password', '');
    await sharedPreferences.setString('phone', '');
    await sharedPreferences.setString('country', '');
    await sharedPreferences.setString('userType', '');
    await sharedPreferences.setString('id', '');
    await sharedPreferences.setString('email', '');
  }
}
