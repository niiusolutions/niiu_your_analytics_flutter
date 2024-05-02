import 'package:flutter/material.dart';
import 'package:your_analytics/your_analytics.dart';

Future<void> main() async {
  YourAnalytics analytics = YourAnalytics.instance;
  analytics.initialize(YourAnalyticsOptions(
    appId: '',
    baseUrl: 'http://localhost:3000/api/v1',
    accessToken: null,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your Analytics Demo page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              child: const Text(
                "Track PageView",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => trackPageView(),
            ),
            TextButton(
              child: const Text(
                "Track Event",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => trackEvent(),
            ),
            TextButton(
              child: const Text(
                "Track Revenue",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => trackRevenue(),
            ),
            TextButton(
              child: const Text(
                "Set Preferences",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => setPreferences(),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  trackEvent() async {
    YourAnalytics analytics = YourAnalytics.instance;
    await analytics.trackEvent(
        category: 'Default',
        action: 'View Product',
        label: 'Product A',
        value: 0,
        details: {});
  }

  trackPageView() async {
    YourAnalytics analytics = YourAnalytics.instance;
    await analytics.trackPageView(screenName: 'Home');
  }

  trackRevenue() async {
    YourAnalytics analytics = YourAnalytics.instance;
    await analytics.trackRevenue(
        category: 'Default', product: 'Product A', value: 9.9, details: {});
  }

  setPreferences() async {
    YourAnalytics analytics = YourAnalytics.instance;

    await analytics.setPreferences(
      gender: 'Men',
      ageRange: '21-29',
      interests: ['Food', 'Music'],
      others: {},
    );
  }
}
