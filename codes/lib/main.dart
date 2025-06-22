import 'package:flutter/material.dart';

void main() {
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
      ),
      home: const MyHomePage(title: 'Counrtries'),
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


  final List<String> countries = ['United Kingdom', 'United States of America', 'China','Russia','Germany','France','Italy','Japan','Greece','Turkey'];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

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
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countries[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountriesDetailPage(countryName: countries[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class CountriesDetailPage extends StatelessWidget {
  final String countryName;

  const CountriesDetailPage({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    String info = getCountryInfo(countryName);
    String flagAsset = getCountryFlagAsset(countryName);

    return Scaffold(
      appBar: AppBar(title: Text(countryName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                flagAsset,
                width: 150,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCountryInfo(String name) {
    switch (name) {
      case 'United Kingdom':
        return 'United Kingdom is a country in Europe known for London and the royal family.';
      case 'United States of America':
        return 'USA is a large country in North America known for its diversity and power.';
      case 'China':
        return 'China is a populous country in Asia known for its history and Great Wall.';
      case 'Russia':
        return 'Russia is the largest country by area in the world.';
      case 'Germany':
        return 'Germany is known for its engineering and history in Europe.';
      case 'France':
        return 'France is known for its culture, Eiffel Tower and cuisine.';
      case 'Italy':
        return 'Italy is known for its art, food and ancient history.';
      case 'Japan':
        return 'Japan is an island nation known for its technology and tradition.';
      case 'Greece':
        return 'Greece is known for its ancient civilization and islands.';
      case 'Turkey':
        return 'Turkey is a country that bridges Europe and Asia.';
      default:
        return 'Information not available.';
    }
  }

  String getCountryFlagAsset(String name) {
    switch (name) {
      case 'United Kingdom':
        return 'flags/united-kingdom-flag-medium.png';
      case 'United States of America':
        return 'flags/united-states-of-america-flag-medium.png';
      case 'China':
        return 'flags/china-flag-medium.png';
      case 'Russia':
        return 'flags/russia-flag-medium.png';
      case 'Germany':
        return 'flags/germany-flag-medium.png';
      case 'France':
        return 'flags/france-flag-medium.png';
      case 'Italy':
        return 'flags/italy-flag-medium.png';
      case 'Japan':
        return 'flags/japan-flag-medium.png';
      case 'Greece':
        return 'flags/greece-flag-medium.png';
      case 'Turkey':
        return 'flags/turkey-flag-medium.png';
      default:
        return 'flags/united-nations-flag.png'; // fallback varsa
    }
  }
}
