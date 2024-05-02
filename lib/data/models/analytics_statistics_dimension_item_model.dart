import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class AnalyticsStatisticsDimensionItem {
  DataSourceType dataSource = DataSourceType.Events;

  String dimensionPath = 'id';

  AnalyticsStatisticsDimensionItem.fromJson(Map<String, dynamic> json) {
    dataSource = DataSourceType.values.byName(json['dataSource']);
    dimensionPath = json['dimensionPath'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['dataSource'] = dataSource.name;
    data['dimensionPath'] = dimensionPath;

    return data;
  }

  AnalyticsStatisticsDimensionItem.empty();

  @override
  String toString() {
    return '${dataSource.name}: ($dimensionPath)';
  }

  get name {
    return dimensionPath;
  }

  AnalyticsStatisticsDimensionItem clone() {
    return AnalyticsStatisticsDimensionItem.fromJson(toJson());
  }

  void fromDimension(AnalyticsStatisticsDimensionItem metric) {
    dataSource = metric.dataSource;
    dimensionPath = metric.dimensionPath;
  }
}
