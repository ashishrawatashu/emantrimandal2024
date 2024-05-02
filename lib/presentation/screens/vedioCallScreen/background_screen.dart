import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('This is the background page!'),
              Text('If you tap on the floating screen, it stops floating.'),
              Text('Navigation works as expected.'),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                child: Text('Push to navigation'),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
