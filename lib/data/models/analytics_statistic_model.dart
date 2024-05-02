import 'package:collection/collection.dart';
import 'package:your_analytics/data/models/analytics_statistics_metric_item_model.dart';

class AnalyticsStatistics {
  List<double> lv_30 = [-1, -1, -1, -1];
  List<double> lv_33 = [-1, -1, -1, -1];
  List<String> lv_21 = ['', ''];
  String timeDimension = '';
  String label = '';

  AnalyticsStatistics({
    required this.lv_30,
    required this.lv_33,
    required this.lv_21,
    required this.timeDimension,
  });

  AnalyticsStatistics.fromJson(Map<String, dynamic> json) {
    for (var index in [0, 1, 2, 3]) {
      if (json['metricValue_$index'] != null) {
        lv_30[index] = json['metricValue_$index'];
      }
    }

    for (var index in [0, 1, 2, 3]) {
      if (json['metricCount_$index'] != null) {
        lv_33[index] = json['metricCount_$index'];
      }
    }

    for (var index in [0, 1]) {
      if (json['dimensionValue_$index'] != null) {
        lv_21[index] = json['dimensionValue_$index'];
      }
    }

    timeDimension = json['time_dimension'] ?? 'segment or funnel';
  }

  bool get isNotEmpty {
    return lv_30.firstWhereOrNull((value) => value > 0) != null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    lv_30.asMap().forEach((index, value) {
      data['metricValue_$index'] = value;
    });

    lv_33.asMap().forEach((index, value) {
      data['metricCount_$index'] = value;
    });

    lv_21.asMap().forEach((index, value) {
      data['dimensionValue_$index'] = value;
    });

    data['time_dimension'] = timeDimension;

    return data;
  }

  @override
  String toString() {
    return timeDimension;
  }

  AnalyticsStatistics.fromFunnelMetric(
      AnalyticsStatisticsMetricItem metric, int lv_23) {
    lv_21[0] = '$lv_23';
    lv_30[lv_23] = 0;
    timeDimension = 'segment or funnel';
  }

  AnalyticsStatistics.fromTimeSeriesDate(DateTime current, int metricLength) {
    for (var index in List.generate(metricLength, (i) => i)) {
      lv_30[index] = 0;
    }
    timeDimension = current.toString();
  }
}
