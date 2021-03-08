import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'screens/place_form_screen.dart';
import 'utils/app_routes.dart';
import 'screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesListScreen(),
        routes: {
          AppRouts.PLACE_FORM: (ctx) => PlaceFormScreen(),
        },
      ),
    );
  }
}
