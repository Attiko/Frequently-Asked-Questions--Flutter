import 'dart:convert';

import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:http/http.dart' as http;

import 'HomePage.dart';
// import 'DataModel.dart';

// void main() {
//   runApp(AskQuestions());
// }

// // @override
// // State<AskQuestions> createState() => _AskQuestionsState();

// class AskQuestions extends StatelessWidget {
//   final myController = TextEditingController();
//   void initState() {
//     // super.initState();
//     myController.addListener(() {
//       print(myController.text);
//     });
//   }

void main() => runApp(AskQuestions());

// ignore: public_member_api_docs
class AskQuestions extends StatefulWidget {
  @override
  _AskQuestionsState createState() => _AskQuestionsState();
}

class QuestionsModels {
  QuestionsModels({
    required this.title,
    required this.summary,
    required this.description,
    // required this.user_id,
    // required this.date,
    // required this.created_at,
    // required this.names,
  });

  String title;
  String summary;
  String description;
  // String user_id;
  // String date;
  // String created_at;
  // String names;

  factory QuestionsModels.fromJson(Map<String, dynamic> json) =>
      QuestionsModels(
        title: json["title"],
        summary: json["summary"],
        description: json["description"],
        // user_id: json["user_id"],
        // date: json["date"],
        // created_at: json["created_at"],
        // names: json["names"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "summary": summary,
        "description": description,
        // "user_id": user_id,
        // "date": date,
        // "created_at": created_at,
        // "names": names,
      };
}

Future<QuestionsModels> submitData(
  String title,
  String summary,
  String description,
  // String user_id,
  // String date,
  // String created_at,
  // String names,
) async {
  var response =
      await http.post(Uri.parse("http://localhost:8080/questions"), body: {
    "title": title,
    "summary": summary,
    "description": description,
    // "user_id": user_id,
    // "date": date,
    // "created_at": created_at,
    // "names": names,
  });

  var data = response.body;
  print(data);

  if (response.statusCode == 201) {
    return QuestionsModels.fromJson(jsonDecode(response.body));

    // String responseString = response.body;
    // dataModelFromJson(responseString);
  } else {
    throw Exception('Failed to Add question');
  }
}

class _AskQuestionsState extends State<AskQuestions> {
  Future<QuestionsModels>? _futureQuestionsModels;
  String description = 'My great package';
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 226, 226),
        appBar: AppBar(
            title: Text(
              'Fequently Ask Questions',
              style: TextStyle(color: Color.fromARGB(255, 52, 8, 59)),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home, color: Color.fromARGB(255, 47, 7, 54)),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: Colors.purple),
              ),
            ]),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ask a question',
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 18, 58),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Title',
                        hintText: 'e.g Weddings in Nigeria',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: titleController,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      cursorColor: Colors.black,
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Summary',
                        hintText: 'e.g What is the corruption like in the UK ?',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: summaryController,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      obscureText: false,
                      controller: descriptionController,
                      cursorColor: Colors.black,
                      maxLines: 1,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    MarkdownTextInput(
                      (String value) => setState(() => value = controller.text),
                      controller.text,
                      textDirection: TextDirection.ltr,
                      label: 'Description',
                      maxLines: 3,
                      actions: MarkdownType.values,
                      controller: controller,
                    ),
                    MarkdownBody(
                      data: controller.text,
                      shrinkWrap: true,
                    ),
                    SizedBox(height: 30.0),
                    MaterialButton(
                      height: 50,
                      color: Color.fromARGB(255, 31, 2, 36),
                      onPressed: () async {
                        String title = titleController.text;
                        String summary = summaryController.text;
                        String description = descriptionController.text;

                        QuestionsModels mydata = await _futureQuestionsModels!;

                        setState(() {
                          _futureQuestionsModels =
                              mydata as Future<QuestionsModels>?;
                        });
                      },
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
