import 'package:flutter/material.dart';

class DFulldetail extends StatefulWidget {
  final Map data;
  const DFulldetail({Key? key, required this.data}) : super(key: key);

  @override
  _DFulldetailState createState() => _DFulldetailState();
}

class _DFulldetailState extends State<DFulldetail> {
  @override
  Widget build(BuildContext context) {
    // print(widget.data);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Full Detail"),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // widget.data["DPhone"] != null? Text(widget.data["DPhone"]):Center(),
                // widget.data["Donate"] != null? Text(widget.data["Donate"]):Center(),
                // widget.data["PhoneNo"] != null? Text(widget.data["PhoneNo"]):Center(),
                // widget.data["Money"] != null? Text(widget.data["Money"]):Center(),
                // widget.data["email"] != null? Text(widget.data["email"]):Center(),
                // widget.data["username"] != null? Text(widget.data["username"]):Center(),
                // widget.data["Date"] != null? Text(widget.data["Date"]):Center(),
                // widget.data["Reason"] != null? Text(widget.data["Reason"]):Center(),
                const Text(
                  "Distributor Detail",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                _space,
                //  ${widget.data["Index"]}
                Text(
                  "TID: ${widget.data["index"]}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                _space,
                Text(
                  "on ${widget.data["Date"]}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
                _line,
                Text(
                  "Rs. ${widget.data["Money"]}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                _line,
                Text(
                  "Distributor Detail",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),

                _Row(titel: "Name", value: "${widget.data["username"]}"),
                _Row(titel: "PhoneNo", value: "${widget.data["PhoneNo"]}"),
                _Row(titel: "Email", value: "${widget.data["email"]}"),
                _line,
                Text(
                  "Reciver Detail",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                _Row(titel: "Name", value: "${widget.data["Donate"]}"),
                _Row(titel: "Phone No", value: "${widget.data["DPhone"]}"),
                _line,

                Text(
                  "Reason",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "${widget.data["Reason"]}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Row extends StatefulWidget {
  final String titel;
  final String value;
  const _Row({Key? key, required this.titel, required this.value})
      : super(key: key);

  @override
  __RowState createState() => __RowState();
}

class __RowState extends State<_Row> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.titel,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
          Text(
            widget.value,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ),
        ],
      ),
    );
  }
}

Widget get _line => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.black38,
        height: 1,
      ),
    );
Widget get _space => const SizedBox(
      height: 15,
    );
