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
      floatingHeight: 150,
      builder: (context, isFloating) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                PIPView.of(context)!.presentBelow(MantriDashboardScreen());
                // do something
              },
            ),
            backgroundColor: Colors.deepOrange,
            title: Text(" Vedio Call"),
          ),
          body:  Center(
            child: Text("VEDIO CALL IS HERE"),
          )
        );
      },
    );
  }
}
