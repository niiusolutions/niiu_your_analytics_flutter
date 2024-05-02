import 'package:your_analytics/data/models/statistic_preset_info_model.dart';
import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class AnalyticsEvent {
  EventType type = EventType.Action;
  String category = '';
  String action = '';
  String label = '';
  double value = 0.0;
  String details = '{}';
  List<StatisticsPresetInfo> lv_13 = [];

  AnalyticsEvent.fromJson(Map<String, dynamic> json) {
    type = EventType.values.byName(json['type']);
    category = json['category'];
    action = json['action'];
    label = json['label'];
    value = json['value'];
    details = json['details'];

    lv_13 = ((json['presetInfos'] ?? []) as List<dynamic>)
        .map((e) => StatisticsPresetInfo.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['type'] = type.name;
    data['category'] = category;
    data['action'] = action;
    data['label'] = label;
    data['value'] = value;
    data['details'] = details;

    data['presetInfos'] = lv_13.map((e) => e.toJson()).toList();

    return data;
  }

  AnalyticsEvent.empty();

  AnalyticsEvent clone() {
    return AnalyticsEvent.fromJson(toJson());
  }
}
