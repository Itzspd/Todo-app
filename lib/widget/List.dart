import 'package:flutter/material.dart';
import 'package:to_do_app/Models/todo_list.dart';
import './Widgets.dart';

class ListItems extends StatelessWidget {
  final List<TodoList> _list;
  final Function _deleteEvent;

  ListItems(this._list, this._deleteEvent);

  @override
  Widget build(BuildContext context) {
    return _list.isEmpty
        ? Column(
            children: [
              Text(
                'NO events yet',
                style: textstyle(),
              ),
            ],
            //Todo add Empty message.
          )
        : Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 5,
              shadowColor: Colors.blueAccent,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text(
                          _list[index].title,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        //TODO: Format the date more accurately
                        subtitle: Text(
                          _list[index].time.toString(),
                        ),
                        trailing: IconButton(
                          onPressed: () => _deleteEvent,
                          color: Theme.of(context).errorColor,
                          icon: const Icon(
                            Icons.delete_rounded,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _list.length,
              ),
            ),
          );
  }
}
