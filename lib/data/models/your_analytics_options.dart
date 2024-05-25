class YourAnalyticsOptions {
  String appId = '';
  String baseUrl = '';
  String? accessToken;
  bool allowStorage = true;

  YourAnalyticsOptions(
      {required this.appId,
      required this.baseUrl,
      this.accessToken,
      required this.allowStorage});

  YourAnalyticsOptions.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    baseUrl = json['baseUrl'];
    accessToken = json['accessToken'];
    allowStorage = json['allowStorage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['appId'] = appId;
    data['baseUrl'] = baseUrl;
    data['accessToken'] = accessToken;
    data['allowStorage'] = allowStorage;

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
