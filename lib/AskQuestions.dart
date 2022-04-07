import 'dart:convert';

import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:http/http.dart' as http;
import 'Asked.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

void main() => runApp(AskQuestions());

// ignore: public_member_api_docs
class AskQuestions extends StatefulWidget {
  @override
  _AskQuestionsState createState() => _AskQuestionsState();
}

Future<AskedModel?> createQuestion(
  String title,
  String summary,
  String description,
  // String user_id,
  String date,
  // DateTime created_at,
  String names,
) async {
  final response = await http.post(
    Uri.parse("http://localhost:8080/questions"),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "title": title,
      "summary": summary,
      "description": description,

      "date": date,
      // "created_at": created_at,
      "names": names,
    }),
  );

  if (response.statusCode == 201) {
    final String responseString = response.body;
    print(responseString);
    return askedModelFromJson(responseString);
  } else {
    return null;
  }
}

class _AskQuestionsState extends State<AskQuestions> {
//Passing the current date to string

  String sdate = DateTime.now().toIso8601String();
  late AskedModel _ask;
  String description = 'My great package';

  // declearing the var name username for the login users
  String? username;

  //Fectchig the user input for the field
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TextEditingController controller = TextEditingController();

  //Using Shared Preference
  Future<String?> fetchPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? usename = prefs.getString("username");
    return usename;
  }

  @override
  void initState() {
    super.initState();
    fetchPreferences().then((value) {
      setState(() {
        username = value!;
      });
    });
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
            title: Column(
              children: [
                Text(
                  'Fequently Ask Questions',
                  style: TextStyle(color: Color.fromARGB(255, 52, 8, 59)),
                ),
                Text(
                  username!,
                  style: TextStyle(color: Colors.black),
                )
              ],
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
                      controller: titleController,
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
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: summaryController,
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
                    ),
                    SizedBox(height: 10),
                    // TextField(
                    //   controller: descriptionController,
                    //   obscureText: false,
                    //   cursorColor: Colors.black,
                    //   maxLines: 1,
                    //   keyboardType: TextInputType.multiline,
                    //   decoration: InputDecoration(
                    //     labelText: 'Description',
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     border: InputBorder.none,
                    //     labelStyle: TextStyle(color: Colors.black),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colors.black, width: 1.5),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10.0),
                    MarkdownTextInput(
                      (String value) => setState(() => value = controller.text),
                      controller.text,
                      textDirection: TextDirection.ltr,
                      label: 'Description',
                      maxLines: 3,
                      actions: MarkdownType.values,
                      controller: descriptionController,
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
                        final String title = titleController.text;
                        final String summary = summaryController.text;
                        final String description = descriptionController.text;
                        final String date = sdate;
                        final created_at = DateTime.now();
                        final String names = username!;
                        print(names);

                        final AskedModel? ask = await createQuestion(
                            title,
                            summary,
                            description,
                            date,
                            // created_at,
                            names);

                        setState(() {
                          _ask = ask!;
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
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 35, 23, 37))),
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();
                          if (result == null) return;

                          final file = result.files.first;
                          openFile(file);

                          print('Name:${file.name}');
                          print('Bytes:${file.bytes}');
                          print('Size:${file.size}');
                          print('Extension:${file.extension}');
                          print('Path:${file.path}');
                        },
                        child: const Text('Upload Files')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
