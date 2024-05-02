import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerFromBase64 extends StatelessWidget {
  final String base64String;

  PdfViewerFromBase64({required this.base64String});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Uint8List>(
        future: _decodeBase64ToPdf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading PDF'));
          } else {
            return SfPdfViewer.memory(
              snapshot.requireData,
            );
          }
        },
      ),
    );
  }

  Future<Uint8List> _decodeBase64ToPdf() async {
    Uint8List bytes = base64Decode(base64String);
    return bytes;
  }
}
