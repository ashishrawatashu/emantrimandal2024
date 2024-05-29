import 'package:flutter/material.dart';

import '../screens/itemDetailsScreen/pdf_view.dart';

class FullScreenPdfDialog extends StatelessWidget {
  final String base64String;

  const FullScreenPdfDialog({Key? key, required this.base64String})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PdfViewerFromBase64(
                base64String: base64String),
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
