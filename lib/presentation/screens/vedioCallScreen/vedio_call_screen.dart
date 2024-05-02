import 'package:emantrimandal/presentation/screens/vedioCallScreen/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

import '../mantriDashboardScreen/mantri_dashboard_screen.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return PIPView(
      builder: (context, isFloating) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text(" Vedio Call"),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.videocam_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  PIPView.of(context)!.presentBelow(MantriDashboardScreen());
                  // do something
                },
              )
            ],
          ),
          // body:  dashboardBody()
        );
      },
    );
  }
}
