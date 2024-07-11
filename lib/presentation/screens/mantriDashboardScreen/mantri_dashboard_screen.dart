import 'package:emantrimandal/presentation/blocs/itemsBloc/items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriDashboardBloc/mantri_dashboard_bloc.dart';
import 'package:emantrimandal/presentation/screens/itemDetailsScreen/item_details_screen.dart';
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
  String departmentId = "All";

  @override
  void initState() {
    super.initState();
    context.read<MantriDashboardBloc>().add(GetDepartmentsEvent());
    context.read<ItemsBloc>().add(GetItemsEvent());
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

  dashBoardLeftListLayout() {
    return BlocConsumer<MantriDashboardBloc, MantriDashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DepartmentLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetDepartmentsSuccessState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
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
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                                "कुल मदे  " +
                                    MySingleton()
                                        .getMeetingsItemsModel
                                        .items!
                                        .length
                                        .toString(),
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
                itemCount:
                MySingleton().getMeetingsItemsModel.departments!.length,
                itemBuilder: (BuildContext context, int index) {
                  final department = MySingleton()
                      .getMeetingsItemsModel
                      .departments![index];
                  final isSelected =
                      departmentId == department.deptID.toString();
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
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
                                    department.deptName.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "कुल मदे  " +
                                        department.noOfItems.toString(),
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
        return Visibility(
          visible: showListDepartmentWise(index),
          child: listItems(index),
        );
      },
    );
  }

  listItems(int index) {
    var i = index + 1;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.itemDetailsScreen,arguments: index,);
        // showTDialog(index);
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
                          i.toString() +
                          "\n" +
                          MySingleton()
                              .getMeetingsItemsModel
                              .items![index]
                              .deptID
                              .toString(),
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
                        MySingleton()
                            .getMeetingsItemsModel
                            .items![index]
                            .deptID
                            .toString(),
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        MySingleton()
                            .getMeetingsItemsModel
                            .items![index]
                            .briefSubject
                            .toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "File No. " +
                            MySingleton()
                                .getMeetingsItemsModel
                                .items![index]
                                .fileNumber
                                .toString(),
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
                    margin:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(5), // Adjusts the radius of corners
                      border: Border.all(
                        color: Colors.white, // You can set border color here
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "बैंठक का विवरण ",
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

  showTDialog(int index) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return ItemDetailsScreen();
      },
    );
  }

  showListDepartmentWise(int index) {
    if (departmentId == "All") {
      return true;
    } else if (departmentId ==
        MySingleton().getMeetingsItemsModel.items![index].deptID.toString()) {
      return true;
    } else {
      return false;
    }
  }
}
