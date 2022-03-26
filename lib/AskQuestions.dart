import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

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

void main() => runApp(MyApp());

// ignore: public_member_api_docs
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String description = 'My great package';
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
              onPressed: () {},
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
                    ),
                    SizedBox(height: 30),
                    TextField(
                      obscureText: false,
                      controller: controller,
                      cursorColor: Colors.black,
                      maxLines: 1,
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
                    MaterialButton(
                        height: 50,
                        color: Color.fromARGB(255, 31, 2, 36),
                        onPressed: () {},
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                    MarkdownTextInput(
                      (String value) => setState(() => value = controller.text),
                      controller.text,
                      textDirection: TextDirection.ltr,
                      label: 'Description',
                      maxLines: 1,
                      actions: MarkdownType.values,
                      controller: controller,
                    ),
                    MarkdownBody(
                      data: controller.text,
                      shrinkWrap: true,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // setState(String Function() param0) {}
}
