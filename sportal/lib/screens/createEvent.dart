// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
class createEvent extends StatefulWidget {
  static const id = 'createEvent';
  const createEvent({Key? key}) : super(key: key);


  @override
  _createEvent createState() => _createEvent();
}


class _createEvent extends State<createEvent> {

  var name = 'Pickup Basketball';
  var numberOfTeams = '2';
  var numberOfPlayersOnTeam = '6';
  var eventInfo = 'Field 4';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Event Details',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("New Event"),
          ),
          body: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ListTile(
                      leading: Icon(Icons.assignment_outlined, size: 34),
                      title: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Event Name',
                          //hintText: "Event Name",
                        ),
                        onChanged: (text) => setState(() {
                          name = text;
                        }),
                      ),
                      //subtitle: Text('Event Name'),
                    ),
                  )),
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ListTile(
                      leading: Icon(Icons.format_list_numbered_outlined, size: 34),
                      title: TextField(
                        //TODO: This needs some way to select 0/1 teams
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number of teams'
                          //hintText: "Number of teams:",
                        ),
                        onChanged: (text) => setState(() {
                          numberOfTeams = text;
                        }),

                      ),
                      //subtitle: Text('Number of teams'),
                    ),
                  )),
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.people_alt_outlined,
                        size: 34,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number of players on team',
                        ),
                        onChanged: (text) => setState(() {
                          numberOfPlayersOnTeam = text;
                        }),
                      ),
                      //subtitle: Text('Number of players on team'), //TODO: Maybe change this to Number of players if there is no teams
                    ),
                  )),
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ListTile(
                      leading: Icon(Icons.map_outlined, size: 34),
                      title: const Text('Event Location'),
                      trailing: IconButton(
                          onPressed: onPressed,
                          icon: Icon(Icons.location_on_outlined)),
                    ),
                  )),
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ListTile(
                      leading: Icon(Icons.view_headline_outlined, size: 34),
                      title: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Write details about event...",
                        ),
                      ),
                    ),
                  )),
            ],
            shrinkWrap: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:
            submitData,
            tooltip: 'Submit',
            child: const Icon(Icons.add),
          ),
        ));
  }

  Future<void> submitData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('Events').add(<String, dynamic>{
      'Name': name,
      'NumberOfTeams': numberOfTeams,
      'TeamSize': numberOfPlayersOnTeam,
      'EventInfo': eventInfo,
      'Location': 'IM Fields'
    });
  }

  Future<void> onPressed() async {
    var questionList = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('Events').get().then((querySnapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((element) {
        //TODO Create a system to check for questions already asked.
        questionList.add(element.data()["Name"]);
      });
    });
    print(questionList);
  }
//TODO: Navigate to map to select location.
}