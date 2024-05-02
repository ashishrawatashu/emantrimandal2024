import 'dart:io';

import 'package:emantrimandal/core/constants/images_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/styles/colors_code.dart';
import '../../core/styles/hex_color.dart';

class ExceptionDialog {
  ExceptionDialog(BuildContext context,String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius:
              BorderRadius.circular(20.0)), //this right here
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: HexColor(MyColors.dashBg),
                child: Wrap(

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(ImagesPath.oops,width: 80,height: 80,fit: BoxFit.fill,),
                          ),
                        ),
                        Center(child: Padding(
                          padding: const EdgeInsets.only(left: 5.0,right: 5),
                          child: Text(msg,textAlign:TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, MyRoutes.homeRoute);
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5,left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: HexColor(MyColors.orange),
                            ),
                            height: 40,
                            width:MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text("OK",style: TextStyle(color: Colors.white)),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });;
  }
}