import 'dart:collection'; // used in test.dart
import 'dart:html';
import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'HomePage.dart';

void main() {
  runApp(MyFaqs());
}

class MyFaqs extends StatelessWidget {
  const MyFaqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
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

