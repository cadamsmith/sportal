import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportal/brand_colors.dart';
import 'package:sportal/screens/create_event_page.dart';

import 'event_details_page.dart';

class MapPage extends StatefulWidget {
  static const String id = 'map';

  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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

  void getMarkers() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('Events').get().then((querySnapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((element) {
        //TODO Create a system to check for questions already asked.

        var lat = element.data()["Latitude"];
        var long = element.data()["Longitude"];

        Marker marker = Marker(
            markerId: MarkerId(element.id),
            position: LatLng(lat, long),
            onTap: () {
              goToEventDetailsPage(element.id);
            });

        markers.add(marker);
      });
    });
  }

  void goToEventDetailsPage(String eventID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => eventDetails(eventID: eventID),
      ),
    );
  }

  void goToCreateEvent() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const createEvent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text('text'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToCreateEvent();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black87,
        ),
        backgroundColor: BrandColors.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Stack(
        children: [
          Builder(
            builder: (_) {
              getMarkers();

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
