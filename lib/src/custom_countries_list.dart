import 'dart:io';

import 'package:custom_countries_list/src/countries.dart';
import 'package:custom_countries_list/src/country_model.dart';
import 'package:custom_countries_list/src/utils/custom_countries_list_typedef.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> countries = allCountries;

void showCountryList({
  required BuildContext context,
  double? height = 200.0,
  required CustomCountriesListCallback? onCountrySelected
}) {
  if (Platform.isIOS) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: height,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: CupertinoPicker(
            itemExtent: 30.0,
            onSelectedItemChanged: (int index) {
              final selectedCountry = CountryModel(
                name: countries[index]['name'],
                code: countries[index]['code'],
                dialCode: countries[index]['dial_code'],
                flag: countries[index]['flag'],
              );
              onCountrySelected!(selectedCountry);
            },
            children: [
              for (var i = 0; i < countries.length; i++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      countries[i]['flag'],
                      style: const TextStyle(fontSize: 25.0),
                    ),
                    Text(
                      countries[i]['name'],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      countries[i]['dial_code'],
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  } else {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height,
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  height: 6.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(countries[index]['name']),
                      leading: Text(
                        countries[index]['flag'],
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      trailing: Text(countries[index]['dial_code']),
                      onTap: () {
                        final selectedCountry = CountryModel(
                          name: countries[index]['name'],
                          code: countries[index]['code'],
                          dialCode: countries[index]['dial_code'],
                          flag: countries[index]['flag'],
                        );
                        onCountrySelected!(selectedCountry);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class CustomCountriesList extends StatefulWidget {
//   final double? height;
//   final CustomCountriesListCallback? onCountrySelected;
//   const CustomCountriesList(
//       {Key? key, this.height = 200, this.onCountrySelected})
//       : super(key: key);

//   @override
//   State<CustomCountriesList> createState() => _CustomCountriesListState();
// }

// class _CustomCountriesListState extends State<CustomCountriesList> {
//   final List<Map<String, dynamic>> countries = allCountries;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showCountryList();
//       },
//       child: Container(
//         height: 60,
//         width: 300,
//         color: Colors.red,
//         child: const Center(
//           child: Text('Select Country'),
//         ),
//       ),
//     );
//   }

//   void showCountryList() {
//     if (Theme.of(context).platform == TargetPlatform.iOS) {
//       showCupertinoModalPopup<void>(
//         context: context,
//         builder: (BuildContext context) => Container(
//           height: widget.height,
//           padding: const EdgeInsets.only(top: 6.0),
//           // The Bottom margin is provided to align the popup above the system navigation bar.
//           margin: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           // Provide a background color for the popup.
//           color: CupertinoColors.systemBackground.resolveFrom(context),
//           // Use a SafeArea widget to avoid system overlaps.
//           child: SafeArea(
//             top: false,
//             child: CupertinoPicker(
//               itemExtent: 30.0,
//               onSelectedItemChanged: (int index) {
//                 final selectedCountry = CountryModel(
//                   name: countries[index]['name'],
//                   code: countries[index]['code'],
//                   dialCode: countries[index]['dial_code'],
//                   flag: countries[index]['flag'],
//                 );
//                 widget.onCountrySelected!(selectedCountry);
//               },
//               children: [
//                 for (var i = 0; i < countries.length; i++)
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         countries[i]['flag'],
//                         style: const TextStyle(fontSize: 25.0),
//                       ),
//                       Text(
//                         countries[i]['name'],
//                         style: const TextStyle(fontSize: 16.0),
//                       ),
//                       Text(
//                         countries[i]['dial_code'],
//                         style: const TextStyle(fontSize: 14.0),
//                       ),
//                     ],
//                   )
//               ],
//             ),
//           ),
//         ),
//       );
//     } else {
//       showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             height: widget.height,
//             padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//             child: Column(
//               children: [
//                 Center(
//                   child: Container(
//                     margin: const EdgeInsets.only(top: 8.0),
//                     height: 6.0,
//                     width: 80.0,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: countries.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(countries[index]['name']),
//                         leading: Text(
//                           countries[index]['flag'],
//                           style: const TextStyle(fontSize: 30.0),
//                         ),
//                         trailing: Text(countries[index]['dial_code']),
//                         onTap: () {
//                           final selectedCountry = CountryModel(
//                             name: countries[index]['name'],
//                             code: countries[index]['code'],
//                             dialCode: countries[index]['dial_code'],
//                             flag: countries[index]['flag'],
//                           );
//                           widget.onCountrySelected!(selectedCountry);
//                           Navigator.pop(context);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }
