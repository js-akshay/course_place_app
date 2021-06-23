import 'package:flutter/material.dart';
import 'package:place_app_new/providers/greate_places.dart';
import 'package:place_app_new/screens/add_place_screen.dart';
import 'package:place_app_new/screens/places_list_scren.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(ctx)=>AddPlaceScreen(),
        },
      ),
    );
  }
}
