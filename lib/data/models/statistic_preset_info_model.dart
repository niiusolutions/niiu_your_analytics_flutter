import 'package:your_analytics/data/models/analytics_statistics_metric_item_model.dart';
import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class StatisticsPresetInfo {
  String id = '';
  TimeGrain dataTimeGrain = TimeGrain.Hour;
  List<AnalyticsStatisticsMetricItem> metrics = [];
  List<double> lv_30 = [];
  List<int> lv_33 = [];
  List<String> lv_21 = [];
  String signature = '';

  StatisticsPresetInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataTimeGrain = TimeGrain.values.byName(json['dataTimeGrain']);

    metrics = ((json['metrics'] ?? []) as List<dynamic>)
        .map((e) => AnalyticsStatisticsMetricItem.fromJson(e))
        .toList();

    lv_30 = json['metricValues'];
    lv_33 = json['metricCounts'];
    lv_21 = json['dimensionValues'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['dataTimeGrain'] = dataTimeGrain.name;

    data['metrics'] = metrics.map((e) => e.toJson()).toList();

    data['metricValues'] = lv_30;
    data['metricCounts'] = lv_33;
    data['dimensionValues'] = lv_21;
    data['signature'] = signature;

    return data;
  }

  @override
  String toString() {
    return id;
  }

  StatisticsPresetInfo.empty();

  StatisticsPresetInfo clone() {
    return StatisticsPresetInfo.fromJson(toJson());
  }
}
