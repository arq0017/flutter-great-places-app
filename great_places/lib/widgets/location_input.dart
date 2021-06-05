import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/screens/mapBox_screen.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    //! manually checking - Location Service Request - Permission Status
    Location location = new Location();
    final _locationData = await location.getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Center(
                  child: Text(
                    'No Location Chosen',
                    textAlign: TextAlign.center,
                  ),
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
      SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            onPressed: _getCurrentUserLocation,
            icon: Icon(Icons.location_on),
            label: Text('Current Location'),
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(MapBoxScreen.routeName); 
              },
              icon: Icon(Icons.map),
              label: Text('Select on Map'))
        ],
      )
    ]);
  }
}
