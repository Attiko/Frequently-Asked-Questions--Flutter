import 'dart:collection'; // used in test.dart
import 'dart:html';
import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Fequently Ask Questions'),
          backgroundColor: Color.fromARGB(255, 20, 10, 10),
        ),
        body: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/doj.JPG'),
              ),
              Text('Oladimeji Attiko',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                  )),
              Text(
                'Flutter developer',
                style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  color: Colors.purple,
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '+44 123 456 789',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      ),
                    )
                  ])),
              Container(
                  color: Colors.pinkAccent,
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('attioo@coventry.ac.uk',
                          style: TextStyle(fontSize: 20.0, color: Colors.teal))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';

// void main() => runApp(new MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             title: const Text('Frequently Asked Questions'),
//             leading: Icon((Icons.question_answer)),
//             backgroundColor: Colors.purple,
//             actions: [
//               Icon((Icons.share)),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Icon((Icons.message)),
//               )
//             ]),
//         body: Container(
//           padding: EdgeInsets.all(40.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 onChanged: (value) {
//                   print(value);
//                 },
//                 onFieldSubmitted: (value) {
//                   print('submitted: $value');
//                 },
//                 decoration: InputDecoration(
//                   icon: Icon(Icons.send),
//                   hintText: 'Username',
//                   helperText: 'Input your username',
//                   //errorText: 'Error Text',
//                   counterText: '20 characters',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             print('button pressed');
//           },
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add, color: Color.fromARGB(255, 2, 53, 4)),
//               label: "Button 1",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search, color: Colors.blue),
//               label: "Button 2",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.alarm, color: Colors.red),
//               label: "Button 3",
//             ),
//           ],
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     ));

// Image.network(
                          //   'https://ouch-cdn2.icons8.com/fv7W4YUUpGVcNhmKcDGZp6pF1-IDEyCjSjtBB8-Kp_0/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUv/ZjUzYTU4NDAtNjBl/Yy00ZWRhLWE1YWIt/ZGM1MWJmYjBiYjI2/LnN2Zw.png',
                          //   height: 400,
                          // ),

