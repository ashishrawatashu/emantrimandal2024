import 'package:flutter/material.dart';

class FullScreenTextDialog extends StatelessWidget {
  final String text;

  const FullScreenTextDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 2,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
}
