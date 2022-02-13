// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter App Learning',
//         theme: ThemeData(
//           primarySwatch: Colors.green,
//         ),
//         home: MyHomePage());
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class createEvent extends StatelessWidget {
  static const id = 'createEvent';

  createEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Event Details',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("New Down Event"),
          ),
          body: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Card(
                  child: ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: TextField(
                  decoration: InputDecoration(
                      //hintText: "Event Name",
                      ),
                ),
                subtitle: Text('Event Name'),
              )),
              Card(
                  child: Padding(
                padding: EdgeInsets.all(13.0),
                child: ListTile(
                  leading: Icon(Icons.format_list_numbered_outlined),
                  title: TextField(
                    //TODO: This needs some way to select 0/1 teams
                    decoration: InputDecoration(
                      hintText: "Number of teams:",
                    ),
                  ),
                ),
              )),
              Card(
                  child: ListTile(
                leading: Icon(Icons.people_alt_outlined),
                title: TextField(
                  decoration: InputDecoration(
                    hintText:
                        "Number of players on team:", //TODO: Maybe change this to Number of players if there is no teams
                  ),
                ),
              )),
              Card(
                  child: ListTile(
                leading: Icon(Icons.map_outlined),
                title: const Text('Event Location'),
                trailing: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.location_on_outlined)),
              )),
              Card(
                  child: ListTile(
                leading: Icon(Icons.view_headline_outlined),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Event Details",
                  ),
                ),
              )),
            ],
            shrinkWrap: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:
                null, //TODO: Submit data to firebase and navigate to map.
            tooltip: 'Submit',
            child: const Icon(Icons.add),
          ),
        ));
  }

  void onPressed() {
    //TODO: Navigate to map to select location.
  }
}
