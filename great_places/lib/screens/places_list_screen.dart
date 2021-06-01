import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('Visit Places'), actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.route);
            },
            icon: Icon(Icons.add),
          ),
        ]),
        body: Column(children: [
          Consumer<GreatPlaces>(
            child: Center(child: Text('Start your journey !')),
            builder: (ctx, greatPlaces, child) => greatPlaces.items.length <= 0
                ? child
                : ListView.builder(
                    itemCount: greatPlaces.items.length,
                    itemBuilder: (ctx, index) => Container(),
                  ),
          ),
        ]));
  }
}
