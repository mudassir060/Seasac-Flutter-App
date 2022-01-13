// ignore_for_file: unnecessary_const, unnecessary_null_comparison, avoid_print

import 'dart:io';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seasac/BottomBar.dart';
import 'package:seasac/login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController useremailcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();
  String UID = '';
  bool isCheck = false;
  bool NoData = false;
  bool looding = false;

  @override
  Widget build(BuildContext context) {
    void register() async {
      setState(() {
        looding = true;
      });
      final String username = usernamecontroller.text;
      final String useremail = useremailcontroller.text;
      final String PhoneNo = phonenocontroller.text;
      final String userpassword = userpasswordcontroller.text;
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try {
        if (username != null ||
            useremail != null ||
            PhoneNo != null ||
            userpassword != null) {
          final UserCredential user = await auth.createUserWithEmailAndPassword(
              email: useremailcontroller.text,
              password: userpasswordcontroller.text);
          setState(() {
            UID = user.user.uid;
          });
          await firestore.collection("users").doc(UID).set({
            "username": username,
            "email": useremail,
            "PhoneNo": PhoneNo,
            "password": userpassword,
            "UID": user.user.uid,
            "Available_Balance": 0,
            "Panding Balance": 0,
            "Daily Ads": 0,
            "Total Point": 0,
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBar(
                UID: UID,
                Name: username,
                Email: useremail,
                PhoneNo: PhoneNo,
              ),
            ),
          );
        } else {
          print(
              "Name: $username Email: $useremail Password: $userpassword Phone No: $PhoneNo");
          setState(() {
            NoData = true;
          });
        }
        setState(() {
          looding = false;
        });
      } catch (e) {
        setState(() {
          looding = false;
        });
        print("Error ==============>$e");
              Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Error")),
        content: Text("${e.toString()}"),
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
      // print([username, useremail, userpassword]);
    }

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Welcome to Arya Solutions'),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    looding
                        ? const Positioned(
                            child: Center(child: CircularProgressIndicator()))
                        : Center(),
                    Container(
                      height: vhight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // +++++++++++++++++++++++++++++++++++++++Logo Image+++++++++++++++++++++++++++++++++++++++++++++++++++++++
                          Container(
                            height: 150,
                            width: 220,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('images/Logo.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                          ),

                          const SizedBox(height: 10),
                          TextField(
                            controller: usernamecontroller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Username",
                              labelText: "User Name",
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: useremailcontroller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Email",
                              labelText: "Email",
                            ),
                          ),

                          const SizedBox(height: 10),
                          TextField(
                            controller: phonenocontroller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Phone Number",
                                labelText: "Phone Number"),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: userpasswordcontroller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Password"),
                          ),
                          // FlutterPasswordStrength(
                          //     password: userpasswordcontroller.text,
                          //     strengthCallback: (strength) {
                          //       debugPrint(strength.toString());
                          //     }),

                          NoData == true
                              ? const Text(
                                  "Please fill all requirement",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10),
                                )
                              : Container(),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: register,
                            child: const Text(
                              'Registration',
                              // style: TextStyle(fontSize: 10.0),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "I have an account? Login",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
