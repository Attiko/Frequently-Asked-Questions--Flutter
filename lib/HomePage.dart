import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'questions_details.dart';

void main() {
  runApp(
    new MaterialApp(home: new HomePage()),
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DataFromAPI(),
//     );
//   }
// }

var resultText;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data = List.filled(0, 0, growable: true);

  Future<String> getData() async {
    var response = await http.get(Uri.parse("http://localhost:8080/questions"));
    print(response.body);
    setState(() {
      data = jsonDecode(response.body);
    });
    return "congrat";
  }

  @override
  void initState() {
    // super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    getData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextButton(
                      style: TextButton.styleFrom(
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionsDetails(
                              title: data[index]["title"],
                              summary: data[index]["summary"],
                              description: data[index]["description"],
                              names: data[index]["names"],
                              date: data[index]["CAST(date AS char)"],
                            ),
                          ),
                        );
                      },
                      child: Text(data[index]["title"]),
                    ),
                    subtitle: Text(
                      data[index]["summary"],
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text(data[index]["names"]),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           data[index]["description"],
                  //           style: TextStyle(color: Colors.black),
                  //         ),
                  //       ],
                  //     )),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(data[index]["CAST(date AS char)"]),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class Questions {
  final String title, summary, description, user_id, date, created_at;

  Questions(this.title, this.summary, this.description, this.user_id, this.date,
      this.created_at);
}


// builder: (context, AsyncSnapshot snapshot) {
            //   if (data.length == null) {
            //     return Container(
            //       child: Center(
            //         child: Text('Loading...'),
            //       ),
            //     );
            //   } else
            //     return ListView.builder(
            //         itemCount:data.length,
            //         itemBuilder: (context, i) {
            //           return ListTile(
            //             title: Text(data[i]["title"]),
            //           );
            //         });
            // },

             // Future getQuestionData() async {
  //   final response =
  //       await http.get(Uri.parse("http://localhost:8080/questions"));
  //   var jsonData = jsonDecode(response.body);
  //   List<Questions> questions = [];

  //   for (var q in jsonData) {
  //     Questions question = Questions(q["title"], q["summary"], q["description"],
  //         q["user_id"], q["date"], q["created_at"]);
  //     questions.add(question);
  //   }
  //   print(questions.length);
  //   return questions;
  // }
  //  Container(
      //   child: Card(
      //     child: FutureBuilder(
      //       future: getData(),
      //       builder: (context, ) {
      //         if (hasData) {
      //           return Text(data[1][2]);
      //         } else if (snapshot.hasError) {
      //           return Text('${snapshot.error}');
      //         }

      //         // By default, show a loading spinner.
      //         return const CircularProgressIndicator();
      //       },