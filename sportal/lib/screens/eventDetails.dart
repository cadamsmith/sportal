import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App Learning',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage()
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// ignore: camel_case_types, must_be_immutable
class eventDetails extends StatelessWidget {
  static const id = 'eventDetails';
  final String eventID;
  //CollectionReference data = FirebaseFirestore.instance.collection('Events');
  eventDetails({required this.eventID});

  var roster = [
    'Tyler Hirn',
    'Cory Brasher',
    'Adam Smith',
    'Reid Watson',
    'Dwayne Johnson'
  ];
  getRoster() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('Players').get().then((querySnapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((element) {
        roster.add(element.data()["Name"]);
      });
    });
  }

  getTitle() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    // ignore: non_constant_identifier_names
    String Title = 'Bean Bag Toss IM Fields';

    db.collection('Events').get().then((querySnapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((element) {
        if (element.id == eventID) {
          Title = element.data()["Name"].toString();
          Title = Title + " " + element.data()["Location"];
        }
      });
    });

    return Text(Title);
  }

  List<String> images = [
    "images/PF1.jpg",
    "images/PF2.jpeg",
    "images/PF3.jpg",
    "images/PF4.jpeg",
    "images/PF5.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    getRoster();
    
    int counter = 0;
    return MaterialApp(
        title: 'Event Details',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: getTitle(),
            ),
            body: ListView.builder(
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              itemBuilder: (BuildContext, index) {
                if(index%2==0){
                  counter += 1;
                }
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(images[index]),
                    ),
                    title: Text(roster[index]),
                    trailing: Text('Team #' + counter.toString()),
                  ),
                );
              },
              itemCount: roster.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            )));
  }
}