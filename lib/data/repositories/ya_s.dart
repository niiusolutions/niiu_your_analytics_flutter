import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_html/html.dart' as html;

// ignore: camel_case_types
class CYA_S {
  static const storeKey = '_ya_s_';
  static const lv_03 = 'fvd';
  static const lv_04 = 'lvd';
  static const genderKey = 'gde';
  static const ageRangeKey = 'agr';
  static const interestsKey = 'itr';
  static const geoCountryKey = 'gco';
  static const geoCityKey = 'gci';
  static const geoDistrictKey = 'gdi';
  static const utmSourceKey = 'uts';
  static const utmMediumKey = 'utm';
  static const othersKey = 'det';

  bool allowStorage = true;

  CYA_S();

  Future<void> initialize(bool allowStorage) async {
    this.allowStorage = allowStorage;

    if (allowStorage == true) {
      await GetStorage.init(storeKey);
    }
  }

  Future<void> update({required bool allowStorage}) async {
    this.allowStorage = allowStorage;

    if (this.allowStorage == false) {
      if (kIsWeb) {
        html.window.localStorage.remove(storeKey);
      } else {
        await GetStorage(storeKey).erase();
      }
    }
  }

  GetStorage? get box {
    if (allowStorage == true) {
      return GetStorage(storeKey);
    }

    return null;
  }

  DateTime? get me_07 {
    String? value = box?.read(storeKey + lv_03);

    if (value == null) {
      return null;
    }

    return DateTime.parse(value);
  }

  set me_07(DateTime? value) {
    if (value != null) {
      box?.write(storeKey + lv_03, value.toIso8601String());
    }
  }

  DateTime? get me_08 {
    String? value = box?.read(storeKey + lv_04);

    if (value == null) {
      return null;
    }

    return DateTime.parse(value);
  }

  set me_08(DateTime? value) {
    if (value != null) {
      box?.write(storeKey + lv_04, value.toIso8601String());
    }
  }

  Future<void> me_09({
    String? gender,
    String? ageRange,
    String? geoCountry,
    String? geoCity,
    String? geoDistrict,
    List<String>? interests,
    Map<String, dynamic>? others,
  }) async {
    if (gender != null) {
      box?.write(storeKey + genderKey, gender);
    }
    if (ageRange != null) {
      box?.write(storeKey + ageRangeKey, ageRange);
    }
    if (geoCountry != null) {
      box?.write(storeKey + geoCountryKey, geoCountry);
    }
    if (geoCity != null) {
      box?.write(storeKey + geoCityKey, geoCity);
    }
    if (geoDistrict != null) {
      box?.write(storeKey + geoDistrictKey, geoDistrict);
    }
    if (interests != null) {
      box?.write(storeKey + interestsKey, interests);
    }
    if (others != null) {
      box?.write(storeKey + othersKey, others);
    }
  }

  Future<void> me_10({
    String? lv_09,
    String? lv_10,
  }) async {
    if (lv_09 != null) {
      box?.write(storeKey + utmSourceKey, lv_09);
    }
    if (lv_10 != null) {
      box?.write(storeKey + utmMediumKey, lv_10);
    }
  }

  Map<String, dynamic> me_11() {
    var gender = box?.read(storeKey + genderKey);
    var ageRange = box?.read(storeKey + ageRangeKey);
    var interests = box?.read(storeKey + interestsKey);
    var geoCountry = box?.read(storeKey + geoCountryKey);
    var geoCity = box?.read(storeKey + geoCityKey);
    var geoDistrict = box?.read(storeKey + geoDistrictKey);
    var lv_09 = box?.read(storeKey + utmSourceKey);
    var lv_10 = box?.read(storeKey + utmMediumKey);
    var others = box?.read(storeKey + othersKey);

    return {
      'gender': gender,
      'ageRange': ageRange,
      'interests': interests,
      'geoCountry': geoCountry,
      'geoCity': geoCity,
      'geoDistrict': geoDistrict,
      'utmSource': lv_09,
      'utmMedium': lv_10,
      'others': others,
    };
  }

  Future<void> me_13({
    required String lv_29,
    required int lv_26,
  }) async {
    box?.write(storeKey + lv_29, lv_26);
  }

  int getCurrentFunnelMetricIndex({
    required String lv_29,
  }) {
    int? lv_26 = box?.read(storeKey + lv_29);

    return lv_26 ?? -1;
  }
}
