import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seasac/CFulldetail.dart';
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
      .orderBy('index', descending: false)
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
                  width: vwidth,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
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
                        width: 100,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Center(
                          child: Text(
                            "Payment",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
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
                  width: vwidth,
                  height: vhight - 200,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _CollectionStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var Money;
                      var vwidth = MediaQuery.of(context).size.width;
                      var vhight = MediaQuery.of(context).size.height;
                      return ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: ScrollController(),
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CFulldetail(data: data),
                                ),
                              );
                            },
                            child: RefRow(
                              No: data['index'],
                              Name: data['Donate'],
                              Number: data['DPhone'],
                              vwidth: vwidth,
                              Payment: data['Money'],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
  final String Payment;
  final String Name;
  final String Number;
  var vwidth;
  RefRow(
      {Key? key,
      required this.No,
      required this.Payment,
      required this.Name,
      required this.Number,
      required this.vwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colr = No % 2;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        color: colr == 1 ? Colors.black12 : Colors.black26,
        width: vwidth - 15,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: Center(
                  child: Text(
                    "$No",
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  Name,
                ),
              ),
              SizedBox(
                width: 90,
                child: Center(
                  child: Text(
                    Payment,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    Number,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
