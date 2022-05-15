import 'package:flutter/material.dart';

TextStyle textstyle() {
  return const TextStyle(
    color: Colors.blueGrey,
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );
}

Expanded topmenu(String title) {
  return Expanded(
    child: Card(
      elevation: 3,
      shadowColor: Colors.blueAccent,
      margin: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: null,
        child: Text(
          title,
          style: textstyle(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    ),
  );
}

AppBar appbar(String title) {
  return AppBar(
    actions: [
      //Todo add an icon button for more
    ],
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.blueAccent,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    elevation: 0,
    centerTitle: true,
  );
}
