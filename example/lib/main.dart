import 'package:custom_countries_list/custom_countries_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCountry = 'No Country Name Selected';
  String selectedCountryCode = 'No Country Code Selected';
  String selectedCountryDialCode = 'No Country Dial Code Selected';
  String selectedCountryFlag = 'No Country Flag Selected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Here are the Selected Country Details:',
            ),
            Text(
              selectedCountry,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            Text(
              selectedCountryCode,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            Text(
              selectedCountryDialCode,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            Text(
              selectedCountryFlag,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16.0,
                  ),
            ),
            // CustomCountriesList(
            //   onCountrySelected: (country) {
            //     if (kDebugMode) {
            //       print('selected country ${country?.name}');
            //     }
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCountryList(
            context: context,
            onCountrySelected: (country) {
              setState(() {
                selectedCountry = country!.name;
                selectedCountryCode = country.code;
                selectedCountryDialCode = country.dialCode;
                selectedCountryFlag = country.flag;
              });
              if (kDebugMode) {
                print('selected country ${country?.name}');
              }
            },
            height: 400.0,
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
