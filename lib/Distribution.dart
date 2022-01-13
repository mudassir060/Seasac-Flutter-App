import 'package:flutter/material.dart';

class Distribution extends StatefulWidget {
  const Distribution({ Key? key }) : super(key: key);

  @override
  _DistributionState createState() => _DistributionState();
}

class _DistributionState extends State<Distribution> {
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
        tooltip: 'Distribution',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}