import 'dart:convert';

// used in test.dart
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  List data = List.filled(0, 0, growable: true);

  Future getQuestionData() async {
    var response =
        await http.get(Uri.http('http://localhost:8080', '/questions'));
    setState(() {
      data = jsonDecode(response.body);
    });

    // var jsonData = jsonDecode(response.body);
    // Text ()

    @override
    void initState() {
      // super.initState();
      // WidgetsBinding.instance?.addPostFrameCallback((_) {
      getQuestionData();
      // });
    }

    // List<Questions> questions = [];

    // for (var q in data) {
    //   Questions question = Questions(q["title"], q["summary"], q["description"],
    //       q["user_id"], q["date"], q["created_at"]);
    //   questions.add(question);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: Container(
        child: Card(
          child: ListView.builder(
              // future: getQuestionData(),

              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  child: ListTile(
                    title: Text(data[i]["summary"]),
                  ),
                );
                //  else
                //   return ListView.builder(

                //       itemBuilder: (context, int i) {
                //         return ListTile(
                //           title: Text(data[i]["title"]),
                //         );
                //       });
              }),
        ),
      ),
    );
  }
}

class Questions {
  final String title, summary, description, user_id, date, created_at;

  Questions(this.title, this.summary, this.description, this.user_id, this.date,
      this.created_at);
}
