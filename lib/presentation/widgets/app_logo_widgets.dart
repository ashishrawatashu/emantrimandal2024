import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/all_strings_class.dart';
import '../../core/constants/images_path.dart';

class AppLogo {
  static  eCabinetLogo(){
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              ImagesPath.eCabinetLogo,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ई-कैबिनेट",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange,),textAlign: TextAlign.center,),
              Text("मध्य प्रदेश सरकार",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.deepOrange,),textAlign: TextAlign.center,),
            ],
          )
        ],
      ),
    );




  }


}