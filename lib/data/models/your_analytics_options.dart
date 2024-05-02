class YourAnalyticsOptions {
  String appId = '';
  String baseUrl = '';
  String? accessToken;

  YourAnalyticsOptions(
      {required this.appId, required this.baseUrl, this.accessToken});

  YourAnalyticsOptions.fromJson(Map<String, dynamic> json) {
    appId = json['appId'];
    baseUrl = json['baseUrl'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['appId'] = appId;
    data['baseUrl'] = baseUrl;
    data['accessToken'] = accessToken;

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
