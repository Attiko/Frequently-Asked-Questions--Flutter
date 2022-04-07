import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginPage.dart';
import 'AskQuestions.dart';
import 'questions_details.dart';
// import 'trail.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(home: HomePage()),
  );
}

var resultText;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List data = List.filled(0, 0, growable: true);
  // String? username;
  Future<String> getData() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // username = prefs.getString("username");
    //print(username);
    var response = await http.get(Uri.parse("http://localhost:8080/questions"));
    print(response.body);
    setState(() {
      data = jsonDecode(response.body);
    });

    return "congrat";
  }

  // Future<String?> fetchPreferences() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? usename = prefs.getString("username");
  //   return usename;
  // }

  @override
  void initState() {
    // super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    // fetchPreferences().then((value) {
    //   setState(() {
    //     username = value!;
    //   });
    // });
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
          title: Column(
            children: [
              Text(
                'All Questions',
                style: TextStyle(color: Colors.black),
              ),
              // Text(
              //   username!,
              //   style: TextStyle(
              //     color: Colors.black,
              //   ),
              //   textAlign: TextAlign.right,
              // )
            ],
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
                            // question_id: data[index]["question_id"],
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
              context, MaterialPageRoute(builder: (context) => LoginPage()));
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
