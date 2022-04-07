import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class QuestionsDetails extends StatefulWidget {
  const QuestionsDetails({
    this.title,
    this.summary,
    this.description,
    this.names,
    this.date,
    // this.question_id
  });
  final String? title;
  final String? summary;
  final String? description;
  final String? names;
  final String? date;
  // final int? question_id;

  @override
  State<QuestionsDetails> createState() => _QuestionsDetailsState();
}

class _QuestionsDetailsState extends State<QuestionsDetails> {
  List data = List.filled(0, 0, growable: true);
  TextEditingController controller = TextEditingController();

  Future<String> getData() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // username = prefs.getString("username");
    //print(username);
    // print(widget.question_id);

    var response = await http.get(Uri.parse("http://localhost:8080/answers"));
    print(response.body);
    setState(() {
      data = jsonDecode(response.body);
      print(data);
    });

    return "congrat";
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.purple,
        title: Text('Details', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        // color: Colors.amber,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              Text(widget.title!,
                  style: TextStyle(fontSize: 25.0, color: Colors.purple)),
            ]),
            Divider(thickness: 1.0),
            Text(widget.summary!, style: TextStyle(color: Colors.black)),
            SizedBox(height: 15.0),
            Text(widget.description!, style: TextStyle(color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.names!, style: TextStyle(color: Colors.black)),
                SizedBox(
                  width: 10.0,
                ),
                Text(widget.date!, style: TextStyle(color: Colors.black)),
              ],
            ),
            // SizedBox(height: 50),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         ListView.builder(
            //           shrinkWrap: true,
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemCount: data == null ? 0 : data.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Card(
            //               child: Column(
            //                 children: [
            //                   ListTile(
            //                     title: Text(data[index]["answer"]),
            //                   )
            //                 ],
            //               ),
            //             );
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            // Column(
            // children: [
            // MarkdownTextInput(
            //   (String value) => setState(() => value = controller.text),
            //   controller.text,
            //   textDirection: TextDirection.ltr,
            //   label: 'Description',
            //   maxLines: 3,
            //   actions: MarkdownType.values,
            //   // controller: descriptionController,
            // ),
            // MarkdownBody(
            //   data: controller.text,
            //   shrinkWrap: true,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // TextField(
            //   obscureText: false,
            //   // controller: descriptionController,
            //   cursorColor: Colors.black,
            //   maxLines: 1,
            //   keyboardType: TextInputType.multiline,

            //   decoration: InputDecoration(
            //     labelText: 'Your Answer',
            //     filled: true,
            //     fillColor: Color.fromARGB(255, 206, 193, 193),
            //     border: InputBorder.none,
            //     labelStyle: TextStyle(color: Colors.black),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.black, width: 1.5),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //   ),
            // ),
            // MaterialButton(
            //   onPressed: () {},
            //   child: Text(
            //     'Answer',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            // ],
            // )
            //   children: [
            //     TextField(
            //       obscureText: false,
            //       controller: descriptionController,
            //       cursorColor: Colors.black,
            //       maxLines: 10,
            //       keyboardType: TextInputType.multiline,

            //       decoration: InputDecoration(
            //         labelText: 'Your Answer',
            //         filled: true,
            //         fillColor: Color.fromARGB(255, 206, 193, 193),
            //         border: InputBorder.none,
            //         labelStyle: TextStyle(color: Colors.black),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.black, width: 1.5),
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 20),
            //     MaterialButton(
            //       height: 50,
            //       color: Color.fromARGB(255, 31, 2, 36),
            //       onPressed: () {},
            //       child: Text(
            //         'ANSWER',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
