import 'package:flutter/material.dart';

import '../../../core/constants/images_path.dart';
import '../../../main/navigation/route_paths.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Emantri Mandal"),
        backgroundColor: Colors.deepOrange,),
      body: Center(
        child: Text("No data found."),
      ),
      floatingActionButton: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(ImagesPath.eCabinetLogo,fit: BoxFit.fill,),
            ),
            Image.asset(ImagesPath.niclogo,fit: BoxFit.fill,)
          ],
        ),),    );

  }
}
