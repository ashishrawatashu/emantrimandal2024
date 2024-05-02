import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:emantrimandal/presentation/blocs/downloadMeetingItemsBloc/download_meeting_items_bloc.dart';

import '../../../main/navigation/route_paths.dart';

class DownloadMeetingItemsScreen extends StatefulWidget {
  const DownloadMeetingItemsScreen({super.key});

  @override
  State<DownloadMeetingItemsScreen> createState() => _DownloadMeetingItemsScreenState();
}

class _DownloadMeetingItemsScreenState extends State<DownloadMeetingItemsScreen> {


  @override
  void initState() {
    super.initState();
    context.read<DownloadMeetingItemsBloc>().add(GetMeetingItemsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Downloading items"),
        backgroundColor: Colors.deepOrange,),
      body: downloadScreenBody(),
    );


  }

  Widget downloadScreenBody(){
    return BlocConsumer<DownloadMeetingItemsBloc, DownloadMeetingItemsState>(
        listener: (context,state){
          if(state is NavigateToDownloadScreenToMantriInfoState){
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamed(context, RoutePaths.mantriInfoScreen);
            });
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutePaths.mantriInfoScreen);
                  },
                  child: Card(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: CircularProgressIndicator(
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Please wait....")
              ],
            )
          );
        });

  }
}
