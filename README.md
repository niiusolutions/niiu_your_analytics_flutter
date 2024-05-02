Your Analytics - Flutter Client SDK :
A Flutter plugin to use the Your Analytics API.

## Features

Tracking:

- trackVisit: automatically by Client SDK
- trackPageView
- trackEvent
- trackRevenue
- setPreferences

Analytics:

- User Acquisition: Daily, New User, ...
- Engagement: Event Segments, Event Funnels, ...
- Revenue: Funnels, ...

## Example

Example source code in /example folder.

## Getting started

- Install SDK :

```
$ flutter pub add your_analytics
```

- Setup Your Analytics backend:

```
serverUrl: Your Analytics admin url, ex: http://localhost:3000/
apiServerUrl: Your Analytics backend url, ex: http://localhost:3000/api/v1
```

- In main.dart, initialize the SDK:

```
  YourAnalytics analytics = YourAnalytics.instance;
  analytics.initialize(YourAnalyticsOptions(
    appId: '',
    baseUrl: 'http://localhost:3000/api/v1',
    accessToken: null,
  ));
```

accessToken: reserve for your extra user authentication, ex: your backend setup an API Gateway in front with authentication mechanism. Otherwise use accessToken: null.

## Usage

- trackVisit: automatically by Client SDK

- trackPageView:

```
  await analytics.trackPageView(screenName: 'Home');
```

- trackEvent:

```
  await analytics.trackEvent(
          category: 'Default',
          action: 'View Product',
          label: product.name,
          value: 0,
          details: {});
```

- trackRevenue:

```
  await analytics.trackRevenue(
          category: 'Default', product: 'Product A', value: 9.9, details: {});
```

- setPreferences:

```
  await analytics.setPreferences(
      gender: 'Men',
      ageRange: '21-29',
      interests: ['Food', 'Music'],
      others: {},
    );
```

## Additional information
