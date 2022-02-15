import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart";

class maps extends StatefulWidget {
  @override
  _mapsState createState() => _mapsState();
}

class _mapsState extends State<maps> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.mapbox.com/styles/v1/astinawahyuni02/ckzmwos9z007j15p1pa27w3ig/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXN0aW5hd2FoeXVuaTAyIiwiYSI6ImNremExaWZ1dDE4bGUybnBxNnhjaGx2a2UifQ.U-PrkLm0P-H6hVj8ot2mEQ",
          additionalOptions: {
            'accessToken':'pk.eyJ1IjoiYXN0aW5hd2FoeXVuaTAyIiwiYSI6ImNremExaWZ1dDE4bGUybnBxNnhjaGx2a2UifQ.U-PrkLm0P-H6hVj8ot2mEQ',
            'id':'mapbox.mapbox-streets-v8',
          },
          // attributionBuilder: (_) {
          //   return Text("© OpenStreetMap contributors");
          // },
        ),
        // MarkerLayerOptions(
        //   markers: [
        //     Marker(
        //       width: 80.0,
        //       height: 80.0,
        //       point: LatLng(51.5, -0.09),
        //       builder: (ctx) =>
        //           Container(
        //             child: FlutterLogo(),
        //           ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
