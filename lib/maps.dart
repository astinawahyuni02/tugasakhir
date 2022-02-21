import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class maps extends StatefulWidget {
  @override
  State<maps> createState() => MapSampleState();
}

class MapSampleState extends State<maps> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.924457, 100.425400),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-0.924457, 100.425400),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // GoogleMapController mapController;
  bool mapToggle = false;
  // var currentLocation;
  // var client = [];
  //
  // void initState() {
  //   super.initState();
  //   Geolocator.getCurrentPosition().then((currloc) =>
  //       setState(() {
  //         currentLocation = currloc;
  //         mapToggle = true;
  //         populateClients();
  //       })
  //   );
  // }
  //
  // populateClients(){
  //   client=[];
  //   Firestore.instance.collection('marker').getDocuments().then((docs){
  //     if(docs.documents.isNotEmpty){
  //       for(int i=0; i<docs.documents.length; ++i){
  //         client.add(docs.documents[i].data);
  //         initMarker(docs.documents[i].data);
  //       }
  //     }
  //   });
  // }

  // initMarker(client){
  //   mapController.clearMarkers().then((val){
  //     mapController.addMarker(
  //       MarkerOptions(
  //         position: LatLng(client['location'].lattitude, client['location'].longitude)
  //       )
  //     );
  //   });
  //   }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children :[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 80.0,
                width: double.infinity,
                child: mapToggle ?
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ): Center(
                  child: Text(
                    'Loading .. Please Wait ..',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                )
              )
            ],
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Zoom'),
        icon: Icon(Icons.zoom_in),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


}
