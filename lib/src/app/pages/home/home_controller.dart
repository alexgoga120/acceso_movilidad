import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_presenter.dart';

class HomeController extends Controller {
  final HomePresenter homePresenter;

  HomeController()
      : homePresenter = HomePresenter(),
        super();

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void onClickMail() async {
    EmailContent email = EmailContent(to: [
      'alexgoga120@gmail.com',
    ], subject: 'Hello!', body: "You're sending an email from flutter");

    OpenMailAppResult result = await OpenMailApp.composeNewEmailInMailApp(
        nativePickerTitle: 'Select email app to compose', emailContent: email);
    if (!result.didOpen && !result.canOpen) {
      _showNoMailAppsDialog(getContext());
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: getContext(),
        builder: (_) => MailAppPickerDialog(
          mailApps: result.options,
          emailContent: email,
        ),
      );
    }
  }

  void onClickGithub() {
    const githubUrl = "https://github.com/alexgoga120";
    _openUrl(githubUrl);
  }

  void onClickLinkedin() {
    const githubUrl = "https://www.linkedin.com/in/alex-gomez-garcia/";
    _openUrl(githubUrl);
  }

  Future<void> _openUrl(url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  void _showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    homePresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
