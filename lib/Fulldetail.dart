import 'package:flutter/material.dart';

class Fulldetail extends StatefulWidget {
  final Map data;
  const Fulldetail({Key? key, required this.data}) : super(key: key);

  @override
  _FulldetailState createState() => _FulldetailState();
}

class _FulldetailState extends State<Fulldetail> {
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
          child: Column(
            children: [
              // widget.data["DPhone"] != null? Text(widget.data["DPhone"]):Center(),
              // widget.data["Donate"] != null? Text(widget.data["Donate"]):Center(),
              // widget.data["PhoneNo"] != null? Text(widget.data["PhoneNo"]):Center(),
              // widget.data["Money"] != null? Text(widget.data["Money"]):Center(),
              // widget.data["email"] != null? Text(widget.data["email"]):Center(),
              // widget.data["username"] != null? Text(widget.data["username"]):Center(),
              // widget.data["Date"] != null? Text(widget.data["Date"]):Center(),
              // widget.data["Reason"] != null? Text(widget.data["Reason"]):Center(),
              Text(
                "Full Detail",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              _space,
              //  ${widget.data["Index"]}
              Text(
                "TID: 1",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              _space,
              Text(
                "on 123  23432",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
              _line,
              Text(
                "Rs. 700.00",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              _line,
              Text(
                "Collector Detail",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              _Row(titel: "Name", value: "Mudassir"),
              _Row(titel: "Ph No", value: "03454335400"),
              _Row(titel: "Email", value: "mudassirmukhtar4@gmail.com"),
              _line,
              Text(
                "Doner Detail",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              _Row(titel: "Name", value: "Azeem"),
              _Row(titel: "Ph No", value: "03454335400"),
              _Row(titel: "Email", value: "200"), _line,
            ],
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
