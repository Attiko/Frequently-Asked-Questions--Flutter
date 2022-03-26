import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('intro'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(summary!),
                    Text(description!),
                    Text(names!),
                    Text(date!),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
