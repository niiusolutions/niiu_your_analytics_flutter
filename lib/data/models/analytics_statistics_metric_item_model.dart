import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class AnalyticsStatisticsMetricItem {
  DataSourceType dataSource = DataSourceType.Events;
  AggregateFunc aggregateFunc = AggregateFunc.Count;
  String metricPath = 'id';
  String metricName = '';

  AnalyticsStatisticsMetricItem.fromJson(Map<String, dynamic> json) {
    dataSource = DataSourceType.values.byName(json['dataSource']);
    aggregateFunc = AggregateFunc.values.byName(json['aggregateFunc']);
    metricPath = json['metricPath'];
    metricName = json['metricName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['dataSource'] = dataSource.name;
    data['aggregateFunc'] = aggregateFunc.name;
    data['metricPath'] = metricPath;
    data['metricName'] = metricName;

    return data;
  }

  AnalyticsStatisticsMetricItem.empty();

  @override
  String toString() {
    return '${dataSource.name}: ${aggregateFunc.name}($metricPath)';
  }

  AnalyticsStatisticsMetricItem clone() {
    return AnalyticsStatisticsMetricItem.fromJson(toJson());
  }

  void fromMetric(AnalyticsStatisticsMetricItem lv_17) {
    dataSource = lv_17.dataSource;
    aggregateFunc = lv_17.aggregateFunc;
    metricPath = lv_17.metricPath;
    metricName = lv_17.metricName;
  }
}
