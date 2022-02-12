import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TODO: This would have to pull from firebase
 List<String> images = [
   "assets/images/scenary.jpg",
   "assets/images/scenary_red.jpg",
   "assets/images/waterfall.jpg",
   "assets/images/tree.jpg",
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basketball 4/12"), //TODO: Pull the title of the event here.
      ),
      body: ListView.builder(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        itemBuilder: (BuildContext, index){ //TODO: load all the teams and items in the list from firebase
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
              title: Text("Brody Hall"),
              trailing: Text("Team #1"),
            ),
          );
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      )
    );
  }
}