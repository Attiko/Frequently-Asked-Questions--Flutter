import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AskQuestions.dart';
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

    var results =
        await http.get(Uri.parse("http://localhost:8080/answers/1/answers"));
    print(results.body);
    setState(() {
      var x = jsonDecode(response.body);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.purple,
          title: Text(
            'All Questions',
            style: TextStyle(color: Colors.black),
          )),
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
                    child: Text(
                      data[index]["title"],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  subtitle: Text(
                    data[index]["summary"],
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Text(data[index]["names"]),
                ),
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
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AskQuestions()));
        },
        label: const Text('Ask Question'),
        icon: const Icon(Icons.question_answer_sharp),
        backgroundColor: Colors.purple,
      ),
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