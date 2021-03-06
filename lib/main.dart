import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.indigo,
                accentColor: Colors.amber,
                backgroundColor: Colors.white)),
        initialRoute: PlacesListScreen.routeName,
        routes: {
          PlacesListScreen.routeName: (context) => const PlacesListScreen(),
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen()
        },
      ),
    );
  }
}
