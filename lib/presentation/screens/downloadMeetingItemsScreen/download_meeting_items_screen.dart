import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:emantrimandal/presentation/blocs/downloadMeetingItemsBloc/download_meeting_items_bloc.dart';

import '../../../core/constants/images_path.dart';
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
      backgroundColor: Colors.grey.shade100,
      body: downloadScreenBody(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              height: 50,
              ImagesPath.eCabinetLogo,
            ),
          ),
          Image.asset(ImagesPath.niclogo,fit: BoxFit.contain,)
        ],
      ),
    );
  }

  Widget downloadScreenBody(){
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<DownloadMeetingItemsBloc, DownloadMeetingItemsState>(
              listener: (context,state){
                if(state is NavigateToDownloadScreenToMantriInfoState){
                  Navigator.pushNamed(context, RoutePaths.mantriInfoScreen);
                }else if(state is GetMeetingItemsHasNoData){
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pushNamed(context, RoutePaths.errorScreen);
                  });
                }else if(state is GetMeetingItemsError){
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pushNamed(context, RoutePaths.errorScreen);
                  });
                }
              },
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Container(
                          height: 180,
                          width: 180,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: CircularProgressIndicator(
                              color: Colors.deepOrange,
                              strokeWidth: 8.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("कृपया प्रतीक्षा करें....",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.deepOrange),),
                      )
                    ],
                  )
                );
              }),
        ),
      ],
    );

  }
}
