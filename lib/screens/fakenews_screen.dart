// ignore_for_file: prefer_interpolation_to_compose_strings, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../models/screen_arguments_model.dart';
import '../widgets/bottom_navbar.dart';

class FakenewsScreen extends StatelessWidget {
  FakenewsScreen({Key? key}) : super(key: key);
  final discriptionController = TextEditingController();
  final headlineController = TextEditingController();

  static const routeName = "/fakenews";

  Future<void> sendFakeNews(headline, discription) async {
    final Email sendEmail = Email(
      body: 'Begründung warum der Artikel gemeldet wurde: ' + headline,
      subject: 'Dieser Artikel wurde als Fake News gemeldet: ' + headline,
      recipients: ['newsappflutterdart@gmail.com'],
      cc: ['newsappflutterdart@gmail.com'],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(sendEmail);
      platformResponse = 'Success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Report Fake News',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: TextEditingController(text: args.title),
                  //initialValue: args.title,
                  decoration: const InputDecoration(
                    labelText: 'Article heading',
                    hintText: 'Name the article title',
                    prefixIcon: Icon(Icons.newspaper_rounded),
                    border: OutlineInputBorder(),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    controller: discriptionController,
                    maxLines: null,
                    minLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText:
                          'Describe the incorrect information of the article',
                      prefixIcon: const Icon(Icons.view_headline_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    var headline = headlineController.text;
                    var discription = discriptionController.text;
                    sendFakeNews(headline, discription);
                  },
                  child: const Text('Send'),
                ),
              )
            ],
          )),
      bottomNavigationBar: const BottomNavBar(index: 1),
    );
  }
}
