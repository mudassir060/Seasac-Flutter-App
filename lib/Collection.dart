import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seasac/addCollection.dart';

class Collection extends StatefulWidget {
  final String Name;
  final String Email;
  final String PhoneNo;
  Collection({
    required this.Name,
    required this.Email,
    required this.PhoneNo,
  });

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  final Stream<QuerySnapshot> _CollectionStream = FirebaseFirestore.instance
      .collection('Collection')
      .orderBy('index', descending: true)
      // .where('index', isGreaterThan: '3')
      // .limitToLast(2)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Container(
              width: vwidth - 15,
              // height: vwidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // // // // // // // // // heading Row  // // // // // // // // //
                  Container(
                    width: vwidth - 15,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          child: Center(
                            child: Text(
                              "No",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          child: Center(
                            child: Text(
                              "ID",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // // // // // // // // // List Row  // // // // // // // // //
                  Container(
                    height: vhight - 300,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _CollectionStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        var Money;
                        var vwidth = MediaQuery.of(context).size.width;
                        var vhight = MediaQuery.of(context).size.height;
                        return ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          controller: ScrollController(),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            for (var i = 0; i < data.length; i++) {
                              data['Money'];
                              // setState(() {
                              //   Money = data['Money']+Money;
                              // });
                            }
                            return RefRow(
                              No: data['index'],
                              Name: data['Donate'],
                              Number: data['DPhone'],
                              vwidth: vwidth,
                              ID: data['Money'],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 5)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addCollection(
                Name: widget.Name,
                Email: widget.Email,
                PhoneNo: widget.PhoneNo,
              ),
            ),
          );
        },
        tooltip: 'Collection',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RefRow extends StatelessWidget {
  var No;
  final String ID;
  final String Name;
  final String Number;
  var vwidth;
  RefRow(
      {Key? key,
      required this.No,
      required this.ID,
      required this.Name,
      required this.Number,
      required this.vwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colr = No % 2;

    return Container(
      color: colr == 1 ? Colors.black12 : Colors.black26,
      width: vwidth - 15,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Center(
                child: Text(
                  "$No",
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Text(
                Name,
              ),
            ),
            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  ID,
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: Text(
                  Number,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
