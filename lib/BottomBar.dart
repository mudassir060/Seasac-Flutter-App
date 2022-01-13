// import 'package:diceeapp/dice1.dart';
// import 'package:diceeapp/dice2.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// class DiceHome extends StatefulWidget {
//   @override
//   _DiceHomeState createState() => _DiceHomeState();
// }

// class _DiceHomeState extends State<DiceHome> {
//   // ignore: non_constant_identifier_names
// //  var left_image = Random().nextInt(5);
//   // ignore: non_constant_identifier_names
//   var left_image = 1;
//   // ignore: non_constant_identifier_names
//   var right_image = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dice Game'),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.lightBlue[50],
//       body: Center(
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               // ignore: deprecated_member_use
//               child: FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     left_image = Random().nextInt(6) + 1;
//                   });

//                   print("Value $left_image");
//                 },
//                 child: Image.asset('images/dice$left_image.png'),
//               ),
//             ),
//             Expanded(
//               // ignore: deprecated_member_use
//               child: FlatButton(
//                 onPressed: () {
//                   setState(() {
//                     right_image = Random().nextInt(6) + 1;
//                   });
//                   print("DICE 02 Value is $right_image");
//                 },
//                 child: Image.asset('images/dice$right_image.png'),
//               ),
//             ),
//           ],
//         ),
//       ),

// bottomNavigationBar: MyBottomBarDemo(),
//     );
//   }
// }

// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seasac/Collection.dart';
import 'package:seasac/Distribution.dart';
import 'package:seasac/Profile.dart';

class BottomBar extends StatefulWidget {
  final String Name;
  final String Email;
  final String UID;
  final String PhoneNo;
  const BottomBar(
      {Key? key,
      required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UID})
      : super(key: key);
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String Titel = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> tabPages = [
      Collection (          Name: widget.Name,
          Email: widget.Email,
          PhoneNo: widget.PhoneNo,
          ),
      Distribution(),
      ProfilePage(
          Name: widget.Name,
          Email: widget.Email,
          PhoneNo: widget.PhoneNo,
          UID: widget.UID),
    ];

    if (kDebugMode) {
      print({
        "Bottom Bar",
        widget.Name,
        widget.Email,
        widget.PhoneNo,
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
                "Seasac",
                style: TextStyle(color: Colors.white),
              ),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => BottomBar(
          //             Name: widget.Name,
          //             Email: widget.Email,
          //             PhoneNo: widget.PhoneNo,
          //             UID: widget.UID,
          //           ),
          //         ),
          //       );
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back,
          //     )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: onTabTapped,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Collection")),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text("Distribution")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ],
        ),
        body: PageView(
          children: tabPages,
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}





// class MyNavigationBar extends StatefulWidget {
//   @override
//   _MyNavigationBarState createState() => _MyNavigationBarState();
// }

// class _MyNavigationBarState extends State<MyNavigationBar> {
  // int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home',  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Dice 1', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Dice 2', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Flutter BottomNavigationBar Example'),
//       //     backgroundColor: Colors.green
//       // ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//             backgroundColor: Colors.green
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//             backgroundColor: Colors.yellow
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text('Profile'),
//             backgroundColor: Colors.blue,
//           ),
//         ],
//         type: BottomNavigationBarType.shifting,
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         iconSize: 40,
//         onTap: _onItemTapped,
//         elevation: 5
//       ),
//     );
//   }
// }
