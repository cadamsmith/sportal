import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  static const id = 'eventDetails';
  final String eventID;
  //CollectionReference data = FirebaseFirestore.instance.collection('Events');
  EventDetailsPage({Key? key, required this.eventID}) : super(key: key);

  //TODO: This would have to pull from firebase
  List<String> images = [
    "assets/images/scenary.jpg",
    "assets/images/scenary_red.jpg",
    "assets/images/waterfall.jpg",
    "assets/images/tree.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Event Details',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                  "Basketball 4/12"), //TODO: Pull the title of the event here.
            ),
            body: ListView.builder(
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              itemBuilder: (BuildContext, index) {
                //TODO: load all the teams and items in the list from firebase
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(images[index]),
                    ),
                    title: Text("Brody Hall"),
                    trailing: Text("Team #1"),
                  ),
                );
              },
              itemCount: images.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            )));
  }
}
