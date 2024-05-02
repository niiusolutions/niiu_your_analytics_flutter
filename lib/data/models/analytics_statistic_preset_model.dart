import 'package:your_analytics/data/extensions/date_ext.dart';
import 'package:your_analytics/data/models/analytics_statistics_dimension_item_model.dart';
import 'package:your_analytics/data/models/analytics_statistics_filter_item_model.dart';
import 'package:your_analytics/data/models/analytics_statistics_metric_item_model.dart';
import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class AnalyticsStatisticsPreset {
  String id = '';
  PresetType type = PresetType.TimeSeries;
  ChartType chartType = ChartType.Lines;
  LayoutType layoutType = LayoutType.Thin;
  String appId = '';
  String name = '';
  String groupName = 'Advanced';
  int orderIndex = 0;
  TimeGrain displayTimeGrain = TimeGrain.Hour;
  TimeGrain dataTimeGrain = TimeGrain.Hour;
  List<AnalyticsStatisticsMetricItem> metrics = [];
  List<AnalyticsStatisticsDimensionItem> dimensions = [];
  List<AnalyticsStatisticsFilterItem> filters = [];
  String signature = '';

  DateTime createdAt = DateTime.now();

  AnalyticsStatisticsPreset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = PresetType.values.byName(json['type']);
    chartType = ChartType.values.byName(json['chartType']);
    layoutType = LayoutType.values.byName(json['layoutType']);
    appId = json['appId'];
    name = json['name'];
    groupName = json['groupName'];
    orderIndex = json['orderIndex'];
    displayTimeGrain = TimeGrain.values.byName(json['displayTimeGrain']);
    dataTimeGrain = TimeGrain.values.byName(json['dataTimeGrain']);

    metrics = ((json['metrics'] ?? []) as List<dynamic>)
        .map((e) => AnalyticsStatisticsMetricItem.fromJson(e))
        .toList();

    dimensions = ((json['dimensions'] ?? []) as List<dynamic>)
        .map((e) => AnalyticsStatisticsDimensionItem.fromJson(e))
        .toList();

    filters = ((json['filters'] ?? []) as List<dynamic>)
        .map((e) => AnalyticsStatisticsFilterItem.fromJson(e))
        .toList();

    signature = json['signature'] ?? '';

    createdAt = DateTime.parse(json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['type'] = type.name;
    data['chartType'] = chartType.name;
    data['layoutType'] = layoutType.name;
    data['appId'] = appId;
    data['name'] = name;
    data['groupName'] = groupName;
    data['orderIndex'] = orderIndex;
    data['displayTimeGrain'] = displayTimeGrain.name;
    data['dataTimeGrain'] = dataTimeGrain.name;

    data['metrics'] = metrics.map((e) => e.toJson()).toList();

    data['dimensions'] = dimensions.map((e) => e.toJson()).toList();

    data['filters'] = filters.map((e) => e.toJson()).toList();

    data['signature'] = signature;

    data['createdAt'] = createdAt.formatDateTimeFromUtc();

    return data;
  }

  @override
  String toString() {
    return id;
  }

  AnalyticsStatisticsPreset.empty();

  AnalyticsStatisticsPreset clone() {
    return AnalyticsStatisticsPreset.fromJson(toJson());
  }

  void fromPreset(AnalyticsStatisticsPreset lv_15) {
    id = lv_15.id;
    type = lv_15.type;
    chartType = lv_15.chartType;
    layoutType = lv_15.layoutType;
    appId = lv_15.appId;
    name = lv_15.name;
    groupName = lv_15.groupName;
    orderIndex = lv_15.orderIndex;
    displayTimeGrain = lv_15.displayTimeGrain;
    dataTimeGrain = lv_15.dataTimeGrain;

    metrics = lv_15.metrics;

    dimensions = lv_15.dimensions;

    filters = lv_15.filters;

    createdAt = lv_15.createdAt;
  }
}
