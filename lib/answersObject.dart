import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class AnswersDetails extends StatelessWidget {
  const AnswersDetails(
      {this.answer, this.question_id, this.user_id, this.date_answered});
  final String? answer;
  final String? question_id;
  final String? user_id;
  final String? date_answered;

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
              Text(answer!,
                  style: TextStyle(fontSize: 25.0, color: Colors.purple)),
            ]),
            Divider(thickness: 1.0),
            Text(question_id!, style: TextStyle(color: Colors.black)),
            SizedBox(height: 15.0),
            Text(user_id!, style: TextStyle(color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(date_answered!, style: TextStyle(color: Colors.black)),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
