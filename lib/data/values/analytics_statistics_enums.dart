// ignore_for_file: constant_identifier_names

enum PresetType { TimeSeries, Segment, Funnel }

enum ChartType {
  Lines,
  Area,
  Column,
  Pie,
  Doughnut,
  Funnel,
}

enum LayoutType {
  Thin,
  Wide,
  Full,
}

enum EventType {
  PageView,
  Action,
  Revenue,
}

enum EventActionDefaults {
  View,
  Click,
  Play,
  Buy,
}

enum TimeGrain { Minute, Hour, Day, Month, None }

enum FilterFunc { Equal, Contains }

enum DataSourceType { Events, Visits, Preferences, MetricIndexes }

enum AggregateFunc { Count, Sum, Avg }

enum PresetIdDefaults {
  Default,
  VisitStatisticsNewUserDefault,
  VisitStatisticsHourDefault,
  VisitStatisticsDayDefault,
  VisitStatisticsMonthDefault,
  TotalDailyVisitStatisticsDefault,
  EventSegmentStatisticsLabelDefault,
  EventSegmentStatisticsActionDefault,
  EventSegmentStatisticsCategoryDefault,
  PageViewSegmentStatisticsDefault,
  RevenueSegmentStatisticsDefault,
  FunnelStatisticsDefault,
  UtmSourceStatisticsDefault,
  UtmMediumStatisticsDefault,
  DailyVisitsPerUsersStatisticsDefault
}

extension PresetIdDefaultsExt on PresetIdDefaults {
  String get name {
    switch (this) {
      case PresetIdDefaults.Default:
        return '00000000-0000-0000-0000-000000000000';
      case PresetIdDefaults.VisitStatisticsNewUserDefault:
        return '00000000-0000-0000-0000-000000000001';
      case PresetIdDefaults.VisitStatisticsHourDefault:
        return '00000000-0000-0000-0000-000000000002';
      case PresetIdDefaults.VisitStatisticsDayDefault:
        return '00000000-0000-0000-0000-000000000003';
      case PresetIdDefaults.VisitStatisticsMonthDefault:
        return '00000000-0000-0000-0000-000000000004';
      case PresetIdDefaults.TotalDailyVisitStatisticsDefault:
        return '00000000-0000-0000-0000-000000000005';
      case PresetIdDefaults.EventSegmentStatisticsLabelDefault:
        return '00000000-0000-0000-0000-000000000006';
      case PresetIdDefaults.EventSegmentStatisticsActionDefault:
        return '00000000-0000-0000-0000-000000000007';
      case PresetIdDefaults.EventSegmentStatisticsCategoryDefault:
        return '00000000-0000-0000-0000-000000000008';
      case PresetIdDefaults.PageViewSegmentStatisticsDefault:
        return '00000000-0000-0000-0000-000000000009';
      case PresetIdDefaults.RevenueSegmentStatisticsDefault:
        return '00000000-0000-0000-0000-000000000010';
      case PresetIdDefaults.FunnelStatisticsDefault:
        return '00000000-0000-0000-0000-000000000011';
      case PresetIdDefaults.UtmSourceStatisticsDefault:
        return '00000000-0000-0000-0000-000000000012';
      case PresetIdDefaults.UtmMediumStatisticsDefault:
        return '00000000-0000-0000-0000-000000000013';
      case PresetIdDefaults.DailyVisitsPerUsersStatisticsDefault:
        return '00000000-0000-0000-0000-000000000014';
    }
  }
}

enum AnalyticsRangeFilter {
  Today,
  Yesterday,
  Last_7_Days,
  Last_28_Days,
}

extension AnalyticsRangeFilterExt on AnalyticsRangeFilter {
  String get name {
    switch (this) {
      case AnalyticsRangeFilter.Today:
        return 'Today';
      case AnalyticsRangeFilter.Yesterday:
        return 'Yesterday';
      case AnalyticsRangeFilter.Last_7_Days:
        return 'Last 7 Days';
      case AnalyticsRangeFilter.Last_28_Days:
        return 'Last 28 Days';
    }
  }
}

extension AnalyticsRangeFilterStringExt on String {
  AnalyticsRangeFilter get toEnum {
    switch (this) {
      case 'Today':
        return AnalyticsRangeFilter.Today;
      case 'Yesterday':
        return AnalyticsRangeFilter.Yesterday;
      case 'Last 7 Days':
        return AnalyticsRangeFilter.Last_7_Days;
      case 'Last 28 Days':
        return AnalyticsRangeFilter.Last_28_Days;
    }
    return AnalyticsRangeFilter.Today;
  }
}
