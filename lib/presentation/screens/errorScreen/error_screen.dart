import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/images_path.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesPath.namaste,height: 300,fit: BoxFit.fill,),
              Text(MySingleton().ERROR_MSG,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.deepOrange,),textAlign: TextAlign.center,),
              Container(
                color: Colors.deepOrange,
                height: 1,
                width: 400,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(ImagesPath.eCabinetLogo,height: 80,),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image.asset(ImagesPath.niclogo,fit: BoxFit.fill,),
            //
          ],
        ),),    );

  }
}
