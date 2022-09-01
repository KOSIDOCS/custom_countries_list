<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This is a Flutter custom country picker widget, which uses platforms specific picker components to show countries to the users.

## Features

Currently have only country selections and displaying country data like name, dia_code, code and flag.

## Getting started

Add the package to your pubspec.yaml:

 ```yaml
 custom_countries_list: 0.0.1
 ```
 
 In your dart file, import the library:

 ```Dart
 import 'package:custom_countries_list/custom_countries_list.dart';
 ``` 
  Show country picker using `showCountryList`:
```Dart
showCountryList(
  context: context,
  onCountrySelected: (country) {
    if (kDebugMode) {
        print('selected country ${country?.name}');
      }
    },
  height: 400.0,
 );
```

## Usage

In your dart file, import the library:

 ```Dart
 import 'package:custom_countries_list/custom_countries_list.dart';
 ``` 
  Show country picker using `showCountryList`:
```Dart
showCountryList(
  context: context,
  onCountrySelected: (country) {
    if (kDebugMode) {
        print('selected country ${country?.name}');
      }
    },
  height: 400.0,
 );
```

## Additional information

The package is open to contribution, I will be adding more update to it. This is the first feature. You can also tell me what you want to see next.
