import 'package:emantrimandal/presentation/blocs/itemsBloc/items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriDashboardBloc/mantri_dashboard_bloc.dart';
import 'package:emantrimandal/presentation/screens/itemDetailsScreen/item_details_screen.dart';
import 'package:emantrimandal/presentation/screens/vedioCallScreen/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip_view/pip_view.dart';

import '../../../core/constants/images_path.dart';
import '../../../main/navigation/route_paths.dart';

class MantriDashboardScreen extends StatefulWidget {
  const MantriDashboardScreen({super.key});

  @override
  State<MantriDashboardScreen> createState() => _MantriDashboardScreenState();
}

class _MantriDashboardScreenState extends State<MantriDashboardScreen> {


  @override
  void initState() {
    super.initState();
    context.read<MantriDashboardBloc>().add(GetDepartmentsEvent());
    context.read<ItemsBloc>().add(GetItemsEvent());
  }

  @override
  Widget build(BuildContext context) {

    // return PIPView(
    //   builder: (context, isFloating) {
    //
    //   },
    // );
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepOrange,
          title: Text(" Meeting Details"),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.videocam_rounded,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     Navigator.pushReplacementNamed(context, RoutePaths.videoCall);
            //     // do something
            //   },
            // )
          ],
        ),
        body:  dashboardBody(),
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
        ),),
    );

  }

  dashBoardLeftListLayout() {
    return BlocConsumer<MantriDashboardBloc, MantriDashboardState>(
        listener: (context,state){

        },
        builder: (context, state) {

          if(state is DepartmentLoadingState){
            return Container(
              child: CircularProgressIndicator(),
            );
          }else if(state is GetDepartmentsSuccessState){
            return ListView.builder(
              itemCount: MySingleton().getMeetingsItemsModel.departments!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                MySingleton().getMeetingsItemsModel.departments![index].deptName.toString(),
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "कुल मदे  "+ MySingleton().getMeetingsItemsModel.departments![index].noOfItems.toString(),
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }else {
            return SizedBox();
          }


        });



  }

  pendingItemsForDiscussion() {

    return Column(
      children: [
        Expanded(
          child: listForPendingItemsForDiscussion(),
        )
      ],
    );
  }

  listForPendingItemsForDiscussion() {
    return ListView.builder(
      itemCount: MySingleton().getMeetingsItemsModel.items!.length,
      itemBuilder: (BuildContext context, int index) {
        return listItems(index);
      },
    );
  }

  listItems(int index) {
    var i = index + 1;
    return GestureDetector(
      onTap: () {
        print("hi");
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetailsScreen()));
        // Navigator.pushNamed(context, RoutePaths.itemDetailsScreen);
      },
      child: Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 180,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "मद क्रमांक \n" + i.toString() + "\n"+MySingleton().getMeetingsItemsModel.items![index].deptID.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      MySingleton().getMeetingsItemsModel.items![index].deptID.toString(),
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        MySingleton().getMeetingsItemsModel.items![index].briefSubject.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "File No. "+MySingleton().getMeetingsItemsModel.items![index].fileNumber.toString(),
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dashboardBody() {
    return BlocConsumer<MantriDashboardBloc, MantriDashboardState>(
        listener: (context,state){

        },
        builder: (context, state) {
          return Container(
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(child: dashBoardLeftListLayout(),)),
                Expanded(
                    flex:7,
                    child: Container(child: pendingItemsForDiscussion(),)),
              ],
            ),
          );
        });
  }
}
