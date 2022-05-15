import 'package:flutter/material.dart';
import './widget/List.dart';
import './widget/addEvent.dart';
import './widget/Widgets.dart';
import './Models/todo_list.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueAccent, errorColor: Colors.red),
      home: HomeSreen(),
    );
  }
}

class HomeSreen extends StatefulWidget {
  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  final List<TodoList> _singleEvent = [];

//Function for adding new events.
  void _addnewEvent(String _addNewevent) {
    final _newEvent = TodoList(
      time: DateTime.now(),
      title: _addNewevent,
    );
    setState(() {
      _singleEvent.add(_newEvent);
    });
  }

//Funtion to delete events.
//TODO fix the code
  void _deletevent(String title) {
    setState(() {
      _singleEvent.removeWhere((event) => event.title == title);
    });
  }

//Function to show bottom sheet to add new events.
  void _OpenBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: NewEvents(_addnewEvent),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar('To Do App'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //ToDo: Add Gesture Detectors.
                    topmenu('UpcomingEvents'),
                    topmenu('Set Alarm'),
                    topmenu('History'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ListItems(_singleEvent, _deletevent),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add a new Event',
          onPressed: () => _OpenBottomSheet(context),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
