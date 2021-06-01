import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';
import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import 'package:provider/provider.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GreatPlaces()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        title: 'Tournée',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.orange,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.route : (ctx) => AddPlaceScreen() , 
        },
      ),
    );
  }
}
