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
      floatingActionButton: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image.asset(ImagesPath.niclogo,fit: BoxFit.fill,)
          ],
        ),),
    );


  }

  Widget downloadScreenBody(){
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5), // Adjusts the radius of corners
            border: Border.all(
              color: Colors.deepOrange, // You can set border color here
              width: 2.0,          // Border width
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(ImagesPath.eCabinetLogo,height: 50,),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(5),
                    // Adjusts the radius of corners
                    border: Border.all(
                      color: Colors.deepOrange, // You can set border color here
                      width: 2.0,          // Border width
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4,horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5), // Adjusts the radius of corners
                      border: Border.all(
                        color: Colors.white, // You can set border color here
                        width: 2.0,          // Border width
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "बैंठक का डाटा डाउनलोड हो रहा है",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

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
