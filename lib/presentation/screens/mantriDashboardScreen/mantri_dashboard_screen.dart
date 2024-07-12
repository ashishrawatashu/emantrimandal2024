import 'dart:async';

import 'package:emantrimandal/presentation/blocs/itemsBloc/items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriDashboardBloc/mantri_dashboard_bloc.dart';
import 'package:emantrimandal/presentation/screens/itemDetailsScreen/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip_view/pip_view.dart';

import '../../../core/constants/images_path.dart';
import '../../../data/model/getMeetingsItemsModel/departments_model.dart';
import '../../../main/navigation/route_paths.dart';
import '../../blocs/downloadMeetingItemsBloc/download_meeting_items_bloc.dart';

class MantriDashboardScreen extends StatefulWidget {
  const MantriDashboardScreen({super.key});
  @override
  State<MantriDashboardScreen> createState() => _MantriDashboardScreenState();
}

class _MantriDashboardScreenState extends State<MantriDashboardScreen> {
  String departmentId = "All";
  Timer? _timer;



  List<DepartmentsModel> departmentsModelList =  [];



  @override
  void initState() {
    super.initState();
    context.read<MantriDashboardBloc>().add(GetDepartmentsEvent());
    context.read<ItemsBloc>().add(GetItemsEvent());
    _startAutoRefresh();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoRefresh() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      context.read<MantriDashboardBloc>().add(GetDepartmentsEvent());
      if (departmentId == "All") {
        context.read<ItemsBloc>().add(GetItemsEvent());
      } else {
        context.read<ItemsBloc>().add(GetItemsByDeptIdEvent(departmentId));
      }
      context.read<DownloadMeetingItemsBloc>().add(GetMeetingItemsBackgroundEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashboardBody(),
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image.asset(ImagesPath.niclogo, fit: BoxFit.contain)
          ],
        ),
      ),
    );
  }

  Widget dashBoardLeftListLayout() {
    return BlocConsumer<MantriDashboardBloc, MantriDashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DepartmentLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetDepartmentsSuccessState) {
          departmentsModelList  =  state.departmentsModelList;
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ItemsBloc>().add(GetItemsEvent());
                  setState(() {
                    departmentId = "All";
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: departmentId == "All"
                            ? Colors.deepOrange
                            : Colors.white,
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
                                "सभी विभाग",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: departmentId == "All"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "कुल मदे  " + state.totalItems.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: departmentId == "All"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: state.departmentsModelList!.length,
                itemBuilder: (BuildContext context, int index) {
                  final department = state.departmentsModelList![index];
                  final isSelected = departmentId == department.deptID.toString();
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ItemsBloc>().add(GetItemsByDeptIdEvent(department.deptID.toString()));
                          setState(() {
                            departmentId = department.deptID.toString();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          margin:
                          EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color:
                            isSelected ? Colors.deepOrange : Colors.white,
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    department.deptName.toString().trim(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "कुल मदे  " + department.noOfItems.toString().trim(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget pendingItemsForDiscussion() {
    return Column(
      children: [
        Expanded(
          child: listForPendingItemsForDiscussion(),
        )
      ],
    );
  }

  Widget listForPendingItemsForDiscussion() {
    return BlocConsumer<ItemsBloc, ItemsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ItemsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetItemsSuccessState || state is GetItemsByDeptIdSuccessState) {
          var items = state is GetItemsSuccessState ? state.itemsModelList! : (state as GetItemsByDeptIdSuccessState).itemsModelList!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              var item = items[index];
              String deptName= departmentsModelList.firstWhere((department) => department.deptID.toString() == item.deptID.toString(),)?.deptName ?? '';
              return Visibility(
                child: GestureDetector(
                  onTap: () {
                    deptName = departmentsModelList.firstWhere((department) => department.deptID.toString() == item.deptID.toString(),)?.deptName ?? '';
                    showTDialog(item.itemID.toString(),deptName);
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
                                  "मद क्रमांक \n" +
                                      item.itemID.toString() +
                                      "\n" +
                                      item.deptID.toString(),
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
                                    deptName.replaceAll("\n", ""),
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    item.briefSubject.toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "File No. " +
                                        item.fileNumber.toString(),
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
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget dashboardBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(5), // Adjusts the radius of corners
            border: Border.all(
              color: Colors.deepOrange, // You can set border color here
              width: 2.0, // Border width
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
                    child: Image.asset(ImagesPath.eCabinetLogo, height: 50),
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
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          5), // Adjusts the radius of corners
                      border: Border.all(
                        color: Colors.white, // You can set border color here
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "बैठक का विवरण ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange),
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
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(child: dashBoardLeftListLayout()),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 7, child: pendingItemsForDiscussion()),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void showTDialog(String itemId,String deptName) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return ItemDetailsScreen(
          itemId: itemId, deptName: deptName,
        );
      },
    );
  }
}
