import 'package:your_analytics/data/models/statistic_preset_info_model.dart';

class AnalyticsVisit {
  int lv_05 = 0;
  bool lv_06 = false;
  bool lv_07 = false;
  bool lv_08 = false;
  String details = '{}';
  List<StatisticsPresetInfo> lv_13 = [];

  AnalyticsVisit.fromJson(Map<String, dynamic> json) {
    lv_05 = json['noOfDays'];
    lv_06 = json['isFirstOfHour'];
    lv_07 = json['isFirstOfDay'];
    lv_08 = json['isFirstOfMonth'];
    details = json['details'];

    lv_13 = ((json['presetInfos'] ?? []) as List<dynamic>)
        .map((e) => StatisticsPresetInfo.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['noOfDays'] = lv_05;
    data['isFirstOfHour'] = lv_06;
    data['isFirstOfDay'] = lv_07;
    data['isFirstOfMonth'] = lv_08;
    data['details'] = details;

    data['presetInfos'] = lv_13.map((e) => e.toJson()).toList();

    return data;
  }

  AnalyticsVisit.empty();

  AnalyticsVisit clone() {
    return AnalyticsVisit.fromJson(toJson());
  }
}
