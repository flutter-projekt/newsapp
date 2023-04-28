import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../widgets/bottom_navbar.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);
  final discriptionController = TextEditingController();
  final headlineController = TextEditingController();

  static const routeName = "/discover";

  Future<void> sendFakeNews(headline,discription) async {

    final Email send_email = Email(
      body: 'Begründung warum der Artikel gemeldet wurde: '+headline,
      subject: 'Dieser Artikel  wurde als Fakenews gemeldet: '+headline,
      recipients: ['newsappFlutterDart@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );


    String platformResponse;

    try {
      await FlutterEmailSender.send(send_email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Fakenews melden',
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
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: headlineController,
              decoration: InputDecoration(
                labelText: 'Artikelüberschift',
                hintText: 'Nennen Sie die Artikelüberschrift',
                prefixIcon: Icon(Icons.newspaper_rounded),
                border: OutlineInputBorder(),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              controller: discriptionController,
              maxLines: null,
              minLines: 10,
              decoration: InputDecoration(
                labelText: 'Beschreibung',
                hintText: 'Beschreiben Sie die falschen Informationen des Artikels',
                prefixIcon: Icon(Icons.view_headline_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
            )
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child:           ElevatedButton(
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                var headline = headlineController.text;
                var discription = discriptionController.text;
                sendFakeNews(headline,discription);
              },
              child: const Text('Absenden'),
            ),
            )
          ],
        )
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
    );
  }
}
