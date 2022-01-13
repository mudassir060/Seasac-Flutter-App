import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  const Collection({ Key? key }) : super(key: key);

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Collection',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}