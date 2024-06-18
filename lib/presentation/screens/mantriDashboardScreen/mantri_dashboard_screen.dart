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
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.deepOrange,
        //   title: Text("बैंठक का विवरण "),
        //   actions: <Widget>[
        //     // IconButton(
        //     //   icon: Icon(
        //     //     Icons.videocam_rounded,
        //     //     color: Colors.white,
        //     //   ),
        //     //   onPressed: () {
        //     //     Navigator.pushReplacementNamed(context, RoutePaths.videoCall);
        //     //     // do something
        //     //   },
        //     // )
        //   ],
        // ),
        body:  dashboardBody(),
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutePaths.videoCall);
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(100),
                  // Adjusts the radius of corners
                  border: Border.all(
                    color: Colors.deepOrange, // You can set border color here
                    width: 2.0,          // Border width
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.video_call,color: Colors.white,),
                    Text("VC से जुड़े ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                  ],
                ),
              ),
            ),
            Image.asset(ImagesPath.niclogo,fit: BoxFit.contain,)
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
        showTDialog();
        // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetailsScreen()));
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 80,

          decoration: BoxDecoration(
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
                        "बैंठक का विवरण ",
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
          child: BlocConsumer<MantriDashboardBloc, MantriDashboardState>(
              listener: (context,state){
          
              },
              builder: (context, state) {
                return Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(child: Container(child: dashBoardLeftListLayout(),)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 1,color: Colors.grey,)
                            ],
                          )),
                      Expanded(
                          flex:7,
                          child: Container(child: pendingItemsForDiscussion(),)),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  showTDialog(){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return ItemDetailsScreen();
        });
  }

}
