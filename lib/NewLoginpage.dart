import 'dart:convert';

import 'package:flutter/foundation.dart'; // used in test.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:iconsax/iconsax.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'AskQuestions.dart';
import 'Asked.dart';
import 'HomePage.dart';
import 'loginModel.dart';

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'),
          ],
          home: NewLoginpage()),
    );

// ignore: public_member_api_docs
class NewLoginpage extends StatefulWidget {
  @override
  _NewLoginpageState createState() => _NewLoginpageState();
}

class _NewLoginpageState extends State<NewLoginpage> {
  late LoginModel _ask;
  String description = 'My great package';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController user_idController = TextEditingController();
  // final TextEditingController dateController = TextEditingController();
  // final TextEditingController created_atController = TextEditingController();
  // final TextEditingController namesController = TextEditingController();

  // TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // controller.addListener(() {
    //   print(controller.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Work'),
          ),
          body: Container(
            child: Column(children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'username',
                  hintText: 'username',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  // prefixIcon: Icon(
                  //   Iconsax.user,
                  //   color: Colors.purple,
                  //   size: 18,
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'password',
                  hintText: 'password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  // prefixIcon: Icon(
                  //   Iconsax.key,
                  //   color: Colors.purple,
                  //   size: 18,
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final username = usernameController.text;
                    final password = passwordController.text;
                    Future<LoginModel?> loginDetails(
                      String username,
                      String password,
                    ) async {
                      final headers = {'Content-Type': 'application/json'};
                      final response = await http.post(
                        Uri.parse("http://localhost:8080/users"),
                        headers: headers,
                        body: jsonEncode(<String, String>{
                          "username": username,
                          "password": password,
                        }),
                      );
                      if (response.body.contains('true')) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AskQuestions(),
                            ));
                      } else {
                        Alert(context: context, title: "Error", desc: "Error")
                            .show();
                      }
                      return loginModelFromJson(response.body);
                    }

                    final LoginModel? log =
                        await loginDetails(username, password);
                    setState(() {
                      _ask = log!;
                    });
                  },
                  child: Text('Press Me'))
            ]),
          )),
    );
  }
}
