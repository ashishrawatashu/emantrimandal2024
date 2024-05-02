import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/constants/images_path.dart';
import '../../../core/utils/singleton.dart';
import '../../../main/navigation/route_paths.dart';

class MantriInfoScreen extends StatefulWidget {
  const MantriInfoScreen({super.key});

  @override
  State<MantriInfoScreen> createState() => _MantriInfoScreenState();
}

class _MantriInfoScreenState extends State<MantriInfoScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 13), () {
      Navigator.pushNamed(context, RoutePaths.mantriDashboardScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[8],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ई - मंत्रिमण्डल"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(100),
                        child: Image.memory(base64Decode(MySingleton().getDetailsModel.meetingDetail![0].imageMinister.toString()), fit: BoxFit.cover),
                        // child: Image.network('https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=612x612&w=0&k=20&c=QjebAlXBgee05B3rcLDAtOaMtmdLjtZ5Yg9IJoiy-VY=', fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 100),
                                MySingleton().getDetailsModel.meetingDetail![0].ministerNameHindi.toString()+", "
                                    +MySingleton().getDetailsModel.meetingDetail![0].minDesignameForProceedings.toString()+
                                    " आपका स्वागत है ",textStyle: TextStyle(fontSize: 40,color: Colors.deepOrange),),
                            ],
                            isRepeatingAnimation: true,
                            totalRepeatCount: 1,
                          ),
                        ],
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          speed: const Duration(milliseconds: 100),
                          "प्रणाली का पूर्ण स्वामित्व मंत्रिपरिषद विभाग , उत्तराखण्ड के पास निहित है | \nसॉफ्टवेयर का विकास राष्ट्रीय सूचना विज्ञान केंद्र(NIC) द्वारा किया गया है | ",textStyle: TextStyle(fontSize: 30,color: Colors.grey),),
                      ],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 1,
                    ),
                  ],
                ),
                // Expanded(
                //   flex: 2,
                //   child: Column(
                //    crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("मंत्री जी का नाम ",style: TextStyle(fontSize: 25,color: Colors.grey),),
                //             Text("Ashish Rawat",style: TextStyle(fontSize: 25,color: Colors.black),),
                //             Container(
                //               color: Colors.grey,
                //               width: MediaQuery.of(context).size.width,
                //               height: 1,
                //             ),
                //           ],
                //         ),
                //       ),
                //
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("मंत्री पदनाम",style: TextStyle(fontSize: 25,color: Colors.grey),),
                //             Text("Health minister",style: TextStyle(fontSize: 25,color: Colors.black),),
                //             Container(
                //               color: Colors.grey,
                //               width: MediaQuery.of(context).size.width,
                //               height: 1,
                //             ),
                //           ],
                //         ),
                //       ),
                //
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("बैठक का स्थान",style: TextStyle(fontSize: 25,color: Colors.grey),),
                //             Text("Dehradun vidan sabha",style: TextStyle(fontSize: 25,color: Colors.black),),
                //             Container(
                //               color: Colors.grey,
                //               width: MediaQuery.of(context).size.width,
                //               height: 1,
                //             ),
                //           ],
                //         ),
                //       ),
                //
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("विभाग का नाम",style: TextStyle(fontSize: 25,color: Colors.grey),),
                //             Text("Dehradun vidan sabha",style: TextStyle(fontSize: 25,color: Colors.black),),
                //             Container(
                //               color: Colors.grey,
                //               width: MediaQuery.of(context).size.width,
                //               height: 1,
                //             ),
                //           ],
                //         ),
                //       ),
                //
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("ईमेल आईडी",style: TextStyle(fontSize: 25,color: Colors.grey),),
                //             Text("abcd@gmail.co.in",style: TextStyle(fontSize: 25,color: Colors.black),),
                //             Container(
                //               color: Colors.grey,
                //               width: MediaQuery.of(context).size.width,
                //               height: 1,
                //             ),
                //           ],
                //         ),
                //       ),
                //
                //
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(ImagesPath.uklogo),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutePaths.mantriDashboardScreen);

            },
              child: Image.asset(ImagesPath.nicNewLogo))
        ],
      ),),
    );
  }
}
