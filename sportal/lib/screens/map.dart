import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Map extends StatefulWidget {
  static const String id = 'map';

  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;

  var mapBottomPadding = 0.0;

  var geoLocator = Geolocator();
  late Position currentPosition;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  //list of markers
  Set<Marker> markers = {};

  final Stream<QuerySnapshot> eventsStream =
      FirebaseFirestore.instance.collection('events').snapshots();

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    currentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);

    CameraPosition cp = CameraPosition(
      target: pos,
      zoom: 14,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text('text'),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 40,
        child: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.menu,
                color: Colors.black87,
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Events').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final latLng = LatLng(
                  snapshot.data!.docs.first.get('latitude'),
                  snapshot.data!.docs.first.get('longitude'),
                );

                markers.add(
                  Marker(
                    markerId: const MarkerId('location'),
                    position: latLng,
                  ),
                );
              }

              return GoogleMap(
                padding: EdgeInsets.only(
                  bottom: mapBottomPadding,
                ),
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: _kGooglePlex,
                markers: markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  mapController = controller;

                  setState(() {
                    mapBottomPadding = Platform.isAndroid ? 280 : 270;
                  });

                  setupPositionLocator();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
