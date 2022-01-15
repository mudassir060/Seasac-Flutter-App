import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addCollection extends StatefulWidget {
  final String Name;
  final String Email;
  final String PhoneNo;
  addCollection({
    required this.Name,
    required this.Email,
    required this.PhoneNo,
  });

  @override
  _addCollectionState createState() => _addCollectionState();
}

class _addCollectionState extends State<addCollection> {
  int largeindex = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    data() async {
      await firestore
          .collection("Collection")
          .get()
          .then((snapshot) => snapshot.docs.forEach((element) {
                var fdata = element.data();
                if (fdata["index"] >= largeindex) {
                  setState(() {
                    largeindex = fdata["index"];
                    largeindex++;
                  });
                }
              }));
      print(
          "++++++++++++++++++Firebase largeindex $largeindex+++++++++++++++++++++");
    }

    data();
    // print("================addCollection widget=================>");
    // print(widget.Name);
    // print(widget.Email);
    // print(widget.PhoneNo);
    // print(widget.UserProfile);
    String UserName = "User Name";
    String UserEmail = "Abc@gmail.com";
    String PhoneNo = "03XX-XXXXXXXX";
    setState(() {
      UserName = widget.Name;
      UserEmail = widget.Email;
      PhoneNo = widget.PhoneNo;
    });
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    final TextEditingController donatorcontroller = TextEditingController();
    final TextEditingController Moneycontroller = TextEditingController();
    final TextEditingController DPhonecontroller = TextEditingController();

    void UploadCollection() async {
      String Donate = donatorcontroller.text;
      var Money = Moneycontroller.text;
      String DPhone = DPhonecontroller.text;
      if (Donate != "" &&
          DPhone != "" &&
          int.parse(Money).runtimeType == int) {
        try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
        print(formattedDate);
        await firestore
            .collection("Collection")
            .doc(UserName + formattedDate)
            .set({
          "username": UserName,
          "email": UserEmail,
          "PhoneNo": PhoneNo,
          "Donate": Donate,
          "DPhone": DPhone,
          "Money": Money,
          "Date": formattedDate,
          "index": largeindex,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data is Uploaded'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.of(context).pop(); 

      } catch (e) {
        print("Error ==============>$e");
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // dismiss dialog
          },
        );
        AlertDialog alert = AlertDialog(
          title: Center(child: Text("Error")),
          content: Text("$e"),
          actions: [
            okButton,
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
}
      // print([username, useremail, userpassword]);
    }

    // double posbarwidth = 0;
    // if ((vwidth / 1.35) == 550) {
    //   posbarwidth = vwidth / 1.35;
    //   print(posbarwidth);
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Donator Form"),
             leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              _space,
              const Text(
                "Donator Details",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              // // // // // // // // // // donatorcontroller input // // // // // // // // //
              _space,
              TextField(
                controller: donatorcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: "Name"),
              ),
              _space,
              TextField(
                controller: DPhonecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone No',
                    hintText: "Phone No"),
              ),
              _space,
              TextField(
                controller: Moneycontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Money',
                    hintText: "Money"),
              ),
              _space,
              ElevatedButton(
                child: const Text(
                  'Upload',
                  // style: TextStyle(fontSize: 10.0),
                ),
                onPressed: UploadCollection,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

Widget get _space => const SizedBox(
      height: 20,
    );

