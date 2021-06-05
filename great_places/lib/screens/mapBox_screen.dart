import 'package:flutter/material.dart';
import 'package:great_places/helpers/config.helper.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxScreen extends StatelessWidget {
  static const routeName = '/MapBoxScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loadConfigFile(),
            builder: (ctx, snapshot) =>
                (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(child: CircularProgressIndicator())
                    : MapboxMap(
                        accessToken: snapshot.data['mapbox_api_token'],
                        initialCameraPosition:
                            CameraPosition(target: LatLng(45.45, 45.45)),
                      )));
  }
}
