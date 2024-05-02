import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class AnalyticsStatisticsFilterItem {
  DataSourceType dataSource = DataSourceType.Events;
  int metricIndex = -1;
  String metricPath = 'id';
  FilterFunc filterFunc = FilterFunc.Equal;
  String value = '';

  AnalyticsStatisticsFilterItem.fromJson(Map<String, dynamic> json) {
    dataSource = DataSourceType.values.byName(json['dataSource'] ?? 'Events');
    metricIndex = json['metricIndex'];
    metricPath = json['metricPath'];
    filterFunc = FilterFunc.values.byName(json['filterFunc']);
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['dataSource'] = dataSource.name;
    data['metricIndex'] = metricIndex;
    data['metricPath'] = metricPath;
    data['filterFunc'] = filterFunc.name;
    data['value'] = value;

    return data;
  }

  AnalyticsStatisticsFilterItem.empty();

  @override
  String toString() {
    if (metricIndex > -1) {
      return '${dataSource.name} $metricIndex : {$metricPath} ${filterFunc.name} "$value"';
    }
    return '${dataSource.name}: {$metricPath} ${filterFunc.name} "$value"';
  }

  AnalyticsStatisticsFilterItem clone() {
    return AnalyticsStatisticsFilterItem.fromJson(toJson());
  }

  void fromFilter(AnalyticsStatisticsFilterItem filter) {
    metricIndex = filter.metricIndex;
    dataSource = filter.dataSource;
    filterFunc = filter.filterFunc;
    metricPath = filter.metricPath;
    value = filter.value;
  }
}
