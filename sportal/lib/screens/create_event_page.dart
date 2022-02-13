import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateEventPage extends StatefulWidget {
  static const id = 'createEvent';
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  _createEvent createState() => _createEvent();
}

class _createEvent extends State<CreateEventPage> {
  var name = 'Pickup Basketball';
  var numberOfTeams = '2';
  var numberOfPlayersOnTeam = '6';
  var eventInfo = 'Field 4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                  onChanged: (text) => setState(
                    () {
                      name = text;
                    },
                  ),
                ),
                //subtitle: Text('Event Name'),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(
                13.0,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.format_list_numbered_outlined,
                  size: 34,
                ),
                title: TextField(
                  //TODO: This needs some way to select 0/1 teams
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of teams',
                  ),
                  onChanged: (text) => setState(() {
                    numberOfTeams = text;
                  }),
                ),
                //subtitle: Text('Number of teams'),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: ListTile(
                leading: const Icon(
                  Icons.people_alt_outlined,
                  size: 34,
                ),
                title: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of players on team',
                  ),
                  onChanged: (text) => setState(() {
                    numberOfPlayersOnTeam = text;
                  }),
                ),
                //subtitle: Text('Number of players on team'), //TODO: Maybe change this to Number of players if there is no teams
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: ListTile(
                leading: const Icon(Icons.map_outlined, size: 34),
                title: const Text('Event Location'),
                trailing: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.location_on_outlined),
                ),
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: ListTile(
                leading: Icon(
                  Icons.view_headline_outlined,
                  size: 34,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write details about event...",
                  ),
                ),
              ),
            ),
          ),
        ],
        shrinkWrap: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitData,
        tooltip: 'Submit',
        child: const Icon(Icons.add),
      ),
    );
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
