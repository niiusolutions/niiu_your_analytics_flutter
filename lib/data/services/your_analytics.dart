library your_analytics;

import 'package:collection/collection.dart';
import 'package:your_analytics/data/models/analytics_event_model.dart';
import 'package:your_analytics/data/models/analytics_statistic_preset_model.dart';
import 'package:your_analytics/data/models/analytics_statistics_dimension_item_model.dart';
import 'package:your_analytics/data/models/analytics_statistics_filter_item_model.dart';
import 'package:your_analytics/data/models/analytics_statistics_metric_item_model.dart';
import 'package:your_analytics/data/models/analytics_visit_model.dart';
import 'package:your_analytics/data/models/statistic_preset_info_model.dart';
import 'package:your_analytics/data/models/your_analytics_options.dart';
import 'package:your_analytics/data/providers/ya_ap.dart';
import 'package:your_analytics/data/repositories/ya_s.dart';
import 'package:your_analytics/data/values/analytics_statistics_enums.dart';

class YourAnalytics {
  static YourAnalytics? _instance;
  static YourAnalytics get instance => _instance ??= YourAnalytics._();

  YourAnalytics._();

  final lv_01 = CYA_S();
  final lv_02 = CYA_AP();

  YourAnalyticsOptions? options;
  List<AnalyticsStatisticsPreset>? lv_11;

  Future<void> initialize(YourAnalyticsOptions options) async {
    this.options = options;
    lv_02.options = options;

    await lv_01.initialize();

    final today =
        DateTime.now().copyWith(second: 0, millisecond: 0, microsecond: 0);

    final lv_03 = lv_01.me_07;
    if (lv_03 == null) {
      lv_01.me_07 = today;
    }

    final lv_04 = lv_01.me_08;
    lv_01.me_08 = today;

    var lv_05 = 1;
    var lv_06 = true;
    var lv_07 = true;
    var lv_08 = true;

    if (lv_03 != null && lv_04 != null) {
      lv_05 = today.difference(lv_03).inDays + 1;
      lv_06 = today.hour != lv_04.hour;
      lv_07 = today.day != lv_04.day;
      lv_08 = today.month != lv_04.month;
    }

    final lv_09 = Uri.base.queryParameters['utm_source'] ?? 'direct';
    lv_01.me_10(lv_09: lv_09);

    final lv_10 = Uri.base.queryParameters['utm_medium'] ?? 'default';
    lv_01.me_10(lv_10: lv_10);

    try {
      lv_11 = await lv_02.me_12();
    } on Exception catch (_) {}

    await trackVisit(
      lv_05: lv_05,
      lv_06: lv_06,
      lv_07: lv_07,
      lv_08: lv_08,
      details: {},
    );
  }

  Future<void> trackVisit({
    required int lv_05,
    required bool lv_06,
    required bool lv_07,
    required bool lv_08,
    required Map<String, dynamic> details,
  }) async {
    var lv_12 = AnalyticsVisit.empty();
    lv_12.lv_05 = lv_05;
    lv_12.lv_06 = lv_06;
    lv_12.lv_07 = lv_07;
    lv_12.lv_08 = lv_08;
    lv_12.details = details.toString();

    final lv_13 = me_14(lv_11 ?? [], lv_12.toJson(), DataSourceType.Visits);
    lv_12.lv_13 = lv_13;

    try {
      await lv_02.trackVisit(lv_12);
    } on Exception catch (_) {}
  }

  Future<void> trackPageView({required String screenName}) async {
    var lv_14 = AnalyticsEvent.empty();
    lv_14.type = EventType.PageView;
    lv_14.label = screenName;

    final lv_13 = me_14(lv_11 ?? [], lv_14.toJson(), DataSourceType.Events);
    lv_14.lv_13 = lv_13;

    try {
      await lv_02.trackEvent(lv_14);
    } on Exception catch (_) {}
  }

  Future<void> trackEvent({
    required String category,
    required String action,
    required String label,
    required double value,
    required Map<String, dynamic> details,
  }) async {
    var lv_14 = AnalyticsEvent.empty();
    lv_14.type = EventType.Action;
    lv_14.category = category;
    lv_14.action = action;
    lv_14.label = label;
    lv_14.value = value;
    lv_14.details = details.toString();

    final lv_13 = me_14(lv_11 ?? [], lv_14.toJson(), DataSourceType.Events);
    lv_14.lv_13 = lv_13;

    try {
      await lv_02.trackEvent(lv_14);
    } on Exception catch (_) {}
  }

  Future<void> trackRevenue({
    required String category,
    required String product,
    required double value,
    required Map<String, dynamic> details,
  }) async {
    var lv_14 = AnalyticsEvent.empty();
    lv_14.type = EventType.Revenue;
    lv_14.category = category;
    lv_14.action = EventActionDefaults.Buy.name;
    lv_14.label = product;
    lv_14.value = value;
    lv_14.details = details.toString();

    final lv_13 = me_14(lv_11 ?? [], lv_14.toJson(), DataSourceType.Events);
    lv_14.lv_13 = lv_13;

    try {
      await lv_02.trackEvent(lv_14);
    } on Exception catch (_) {}
  }

  Future<void> setPreferences({
    String? gender,
    String? ageRange,
    String? geoCountry,
    String? geoCity,
    String? geoDistrict,
    List<String>? interests,
    Map<String, dynamic>? others,
  }) async {
    try {
      await lv_01.me_09(
        gender: gender,
        ageRange: ageRange,
        geoCountry: geoCountry,
        geoCity: geoCity,
        geoDistrict: geoDistrict,
        interests: interests,
        others: others,
      );
    } on Exception catch (_) {}
  }

  List<StatisticsPresetInfo> me_14(
    List<AnalyticsStatisticsPreset> lv_11,
    Map<String, dynamic> dataJson,
    DataSourceType lv_22,
  ) {
    List<StatisticsPresetInfo> lv_13 = [];

    for (var lv_15 in lv_11) {
      final lv_16 = me_15(lv_15, dataJson, lv_22);
      if (lv_16 != null) {
        lv_13.add(lv_16);
      }
    }

    return lv_13;
  }

  StatisticsPresetInfo? me_15(
    AnalyticsStatisticsPreset preset,
    Map<String, dynamic> dataJson,
    DataSourceType lv_22,
  ) {
    var lv_16 = StatisticsPresetInfo.empty();
    lv_16.id = preset.id;
    lv_16.dataTimeGrain = preset.dataTimeGrain;
    lv_16.metrics = preset.metrics;

    List<double> lv_30 = [];
    List<int> lv_33 = [];

    for (var lv_17 in preset.metrics) {
      bool lv_18 = me_01(preset, lv_17, dataJson, lv_22);

      if (!lv_18) {
        lv_30.add(me_06(lv_17));
        lv_33.add(0);
      } else {
        final lv_28 = me_03(preset, lv_17, dataJson, lv_22);

        lv_30.add(lv_28);
        lv_33.add(1);
      }
    }

    var lv_19 = lv_33.reduce((a, b) => a + b);
    if (lv_19 == 0) return null;

    lv_16.lv_30 = lv_30;
    lv_16.lv_33 = lv_33;

    List<String> lv_21 = [];
    for (var lv_20 in preset.dimensions) {
      if (lv_20.dataSource == DataSourceType.MetricIndexes) {
        final lv_26 = lv_01.getCurrentFunnelMetricIndex(lv_29: preset.id);

        lv_21.add('$lv_26');
      } else {
        final lv_31 = me_04(preset, lv_20, dataJson, lv_22);

        lv_21.add(lv_31.toString());
      }
    }

    lv_16.lv_21 = lv_21;

    lv_16.signature = preset.signature;

    return lv_16;
  }

  bool me_01(
    AnalyticsStatisticsPreset lv_15,
    AnalyticsStatisticsMetricItem lv_17,
    Map<String, dynamic> dataJson,
    DataSourceType lv_22,
  ) {
    //do not track this metric
    if (lv_22 == DataSourceType.Visits &&
        lv_17.dataSource == DataSourceType.Events) {
      return false;
    }

    if (lv_22 == DataSourceType.Events &&
        lv_17.dataSource == DataSourceType.Visits) {
      return false;
    }

    final lv_23 = lv_15.metrics.indexOf(lv_17);

    var lv_24 = lv_15.filters.where((filter) {
      return (filter.metricIndex == -1 || filter.metricIndex == lv_23);
    }).firstWhereOrNull((filter) {
      final lv_25 = me_02(filter, dataJson, lv_22);
      return (lv_25 == false);
    });

    if (lv_24 != null) {
      return false;
    }

    if (lv_15.type == PresetType.Funnel) {
      final currentFunnelMetricIndex =
          lv_01.getCurrentFunnelMetricIndex(lv_29: lv_15.id);

      //this metric is next valid graph note
      if ((currentFunnelMetricIndex + 1) == lv_23) {
        lv_01.me_13(lv_29: lv_15.id, lv_26: lv_23);

        return true;
      } else {
        return false;
      }
    }

    return true;
  }

  me_02(
    AnalyticsStatisticsFilterItem filter,
    Map<String, dynamic> dataJson,
    DataSourceType lv_22,
  ) {
    //this filter do not affect this dataSource
    if (lv_22 == DataSourceType.Visits &&
        filter.dataSource == DataSourceType.Events) {
      return true;
    }

    //this filter do not affect this dataSource
    if (lv_22 == DataSourceType.Events &&
        filter.dataSource == DataSourceType.Visits) {
      return true;
    }

    switch (filter.dataSource) {
      case DataSourceType.Events:
        return me_17(
            dataJson, filter.metricPath, filter.filterFunc, filter.value);
      case DataSourceType.Visits:
        return me_17(
            dataJson, filter.metricPath, filter.filterFunc, filter.value);
      case DataSourceType.Preferences:
        final prefs = lv_01.me_11();

        return me_17(prefs, filter.metricPath, filter.filterFunc, filter.value);
      case DataSourceType.MetricIndexes:
        return true;
      default:
    }

    return false;
  }

  me_03(
    AnalyticsStatisticsPreset lv_15,
    AnalyticsStatisticsMetricItem lv_17,
    Map<String, dynamic> dataJson,
    DataSourceType lv_22,
  ) {
    //do not track this metric
    if (lv_22 == DataSourceType.Visits &&
        lv_17.dataSource == DataSourceType.Events) {
      return me_06(lv_17);
    }

    //do not track this metric
    if (lv_22 == DataSourceType.Events &&
        lv_17.dataSource == DataSourceType.Visits) {
      return me_06(lv_17);
    }

    switch (lv_17.dataSource) {
      case DataSourceType.Events:
        return me_05(dataJson, lv_17.metricPath, lv_17.aggregateFunc);
      case DataSourceType.Visits:
        return me_05(dataJson, lv_17.metricPath, lv_17.aggregateFunc);
      case DataSourceType.Preferences:
        final prefs = lv_01.me_11();

        return me_05(prefs, lv_17.metricPath, lv_17.aggregateFunc);
      case DataSourceType.MetricIndexes:
        return me_06(lv_17);
      default:
    }
  }

  me_04(
    AnalyticsStatisticsPreset lv_15,
    AnalyticsStatisticsDimensionItem lv_20,
    Map<String, dynamic> dataJson,
    DataSourceType lv_22,
  ) {
    //do not track this metric
    if (lv_22 == DataSourceType.Visits &&
        lv_20.dataSource == DataSourceType.Events) {
      return 'no data';
    }

    //do not track this metric
    if (lv_22 == DataSourceType.Events &&
        lv_20.dataSource == DataSourceType.Visits) {
      return 'no data';
    }

    switch (lv_20.dataSource) {
      case DataSourceType.Events:
        return me_16(dataJson, lv_20.dimensionPath);
      case DataSourceType.Visits:
        return me_16(dataJson, lv_20.dimensionPath);
      case DataSourceType.Preferences:
        final prefs = lv_01.me_11();

        return me_16(prefs, lv_20.dimensionPath);
      case DataSourceType.MetricIndexes:
        return 0;
      default:
    }
  }

  me_16(Map<String, dynamic> dataJson, String path) {
    if (path.isEmpty) return '';

    final lv_27 = path.split('.');

    dynamic result = dataJson;

    for (var segment in lv_27) {
      result = result[segment];
    }

    return result;
  }

  bool me_17(
    Map<String, dynamic> dataJson,
    String metricPath,
    FilterFunc filterFunc,
    String value,
  ) {
    final lv_28 = me_16(dataJson, metricPath);

    switch (filterFunc) {
      case FilterFunc.Equal:
        return lv_28.toString() == value;
      case FilterFunc.Contains:
        List<String> values =
            (lv_28 as List<dynamic>).map((e) => e.toString()).toList();
        return values.contains(value);
      default:
        return true;
    }
  }

  me_05(Map<String, dynamic> dataJson, String metricPath,
      AggregateFunc aggregateFunc) {
    final lv_28 = me_16(dataJson, metricPath);

    switch (aggregateFunc) {
      case AggregateFunc.Count:
        return 1;
      case AggregateFunc.Sum:
        return lv_28;
      case AggregateFunc.Avg:
        return lv_28;
      default:
        return true;
    }
  }

  double me_06(AnalyticsStatisticsMetricItem lv_17) {
    return 0;
  }
}
