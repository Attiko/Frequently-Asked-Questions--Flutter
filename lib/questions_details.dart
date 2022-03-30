import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class QuestionsDetails extends StatelessWidget {
  const QuestionsDetails(
      {this.title, this.summary, this.description, this.names, this.date});
  final String? title;
  final String? summary;
  final String? description;
  final String? names;
  final String? date;

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
              Text(title!,
                  style: TextStyle(fontSize: 25.0, color: Colors.purple)),
            ]),
            Divider(thickness: 1.0),
            Text(summary!, style: TextStyle(color: Colors.black)),
            SizedBox(height: 15.0),
            Text(description!, style: TextStyle(color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(names!, style: TextStyle(color: Colors.black)),
                SizedBox(
                  width: 10.0,
                ),
                Text(date!, style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                TextField(
                  obscureText: false,
                  // controller: descriptionController,
                  cursorColor: Colors.black,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,

                  decoration: InputDecoration(
                    labelText: 'Your Answer',
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 193, 193),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  height: 50,
                  color: Color.fromARGB(255, 31, 2, 36),
                  onPressed: () {},
                  child: Text(
                    'ANSWER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
