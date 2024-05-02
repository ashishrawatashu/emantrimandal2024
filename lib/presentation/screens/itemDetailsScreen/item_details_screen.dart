import 'dart:convert';

import 'package:emantrimandal/presentation/screens/itemDetailsScreen/pdf_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/singleton.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen>
    with SingleTickerProviderStateMixin {
  //

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController?.addListener(() async {
    //   if (_tabController?.index == 0) {
    //   } else if (_tabController?.index == 1) {}
    // });
  }

  @override
  Widget build(BuildContext context) {
    print(MySingleton()
        .getMeetingsItemsModel
        .itemsDetails![0]
        .fileEnclosure
        .toString());
    // print(MySingleton().getMeetingsItemsModel.itemsDetails![0].fileApprovedNote.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Item Details"),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(MySingleton()
                      .getMeetingsItemsModel
                      .itemsDetails![0]
                      .itemsDetails
                      .toString()),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8.0),
                        child: Column(
                          children: [
                            // give the tab bar a height [can change height to preferred height]
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                              ),
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20.0,
                                  ),
                                  color: Colors.deepOrange,
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.white,
                                tabs: [
                                  // first tab [you can add an icon using the icon property]
                                  Tab(
                                    child: Text(
                                      'Approval',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),

                                  // second tab [you can add an icon using the icon property]
                                  Tab(
                                    child: Text(
                                      'Attachments',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    //  text: 'Draft List',
                                  ),
                                ],
                              ),
                            ),
                            // tab bar view here
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // first tab bar view widget
                                  PdfViewerFromBase64(
                                      base64String: MySingleton()
                                          .getMeetingsItemsModel
                                          .itemsDetails![0]
                                          .fileApprovedNote
                                          .toString()),
                                  PdfViewerFromBase64(
                                      base64String: MySingleton()
                                          .getMeetingsItemsModel
                                          .itemsDetails![0]
                                          .fileEnclosure
                                          .toString()),

                                  // second tab bar view widget
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
