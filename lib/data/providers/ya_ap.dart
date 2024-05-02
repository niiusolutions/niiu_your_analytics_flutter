import 'package:http/http.dart' as http;
import 'package:your_analytics/data/models/analytics_event_model.dart';
import 'package:your_analytics/data/models/analytics_statistic_preset_model.dart';
import 'package:your_analytics/data/models/analytics_visit_model.dart';
import 'dart:convert';
import 'package:your_analytics/data/models/your_analytics_options.dart';

// ignore: camel_case_types
class CYA_AP {
  YourAnalyticsOptions? options;

  Future<List<AnalyticsStatisticsPreset>> me_12() async {
    try {
      final response = await http.get(
        Uri.parse('${options?.baseUrl}/analytics-statistics/configs'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${options?.accessToken}'
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['presets'];

        List<AnalyticsStatisticsPreset> results = jsonResponse
            .map((model) => AnalyticsStatisticsPreset.fromJson(model))
            .toList();

        return results;
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  Future<void> trackVisit(AnalyticsVisit lv_12) async {
    try {
      var body = lv_12.toJson();

      http.post(
        Uri.parse('${options?.baseUrl}/analytics/track_visit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${options?.accessToken}'
        },
        body: jsonEncode(body),
      );

      return;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<void> trackEvent(AnalyticsEvent lv_14) async {
    try {
      var body = lv_14.toJson();

      http.post(
        Uri.parse('${options?.baseUrl}/analytics/track_event'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${options?.accessToken}'
        },
        body: jsonEncode(body),
      );

      return;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
