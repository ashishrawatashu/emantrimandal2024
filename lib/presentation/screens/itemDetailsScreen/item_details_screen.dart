import 'dart:convert';

import 'package:emantrimandal/presentation/screens/itemDetailsScreen/pdf_view.dart';
import 'package:emantrimandal/presentation/widgets/fullscreen_pdf_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../core/utils/singleton.dart';
import '../../widgets/fullscreen_dialog.dart';

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
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => FullScreenTextDialog(
                      text: MySingleton()
                          .getMeetingsItemsModel
                          .itemsDetails![0]
                          .itemsDetails
                          .toString(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    color: Colors.amber.shade50,
                    padding: const EdgeInsets.all(16),
                    // child: Text(
                    //   MySingleton()
                    //       .getMeetingsItemsModel
                    //       .itemsDetails![0]
                    //       .itemsDetails
                    //       .toString(),
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //   ), /*MySingleton()
                    //   .getMeetingsItemsModel
                    //   .itemsDetails![0]
                    //   .itemsDetails
                    //   .toString()*/
                    // ),

                    child: SingleChildScrollView(
                      child: Html(
                        data: MySingleton()
                              .getMeetingsItemsModel
                              .itemsDetails![0]
                              .itemsDetails
                              .toString(),
                      ),
                    ),

                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.topLeft,
            //     child: Padding(
            //       padding:  EdgeInsets.all(8.0),
            //       child: Text(MySingleton()
            //           .getMeetingsItemsModel
            //           .itemsDetails![0]
            //           .itemsDetails
            //           .toString()),
            //     ),
            //   ),
            // ),

            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8.0),
                        child: Column(
                          children: [
                            // give the tab bar a height [can change height to preferred height]
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                border: Border.all(width: 1, color: Colors.deepOrange,),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepOrange,
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black87,
                                indicatorColor: Colors.deepOrange,
                                automaticIndicatorColorAdjustment: true,
                                tabs: [
                                  // first tab [you can add an icon using the icon property]
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 80),
                                        child: Text(
                                          'Approval',
                                          style: TextStyle(
                                            // color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // second tab [you can add an icon using the icon property]
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 80),
                                        child: Text(
                                          'Attachments',
                                          style: TextStyle(
                                            // color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    //  text: 'Draft List',
                                  ),
                                ],
                              ),
                            ),
                            // tab bar view here
                            const SizedBox(
                              height: 10,
                            ),

                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) => FullScreenPdfDialog(
                                          base64String: MySingleton()
                                              .getMeetingsItemsModel
                                              .itemsDetails![0]
                                              .fileApprovedNote
                                              .toString(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      color: Colors.amber.shade50,
                                      child:PdfViewerFromBase64(
                                          base64String: MySingleton()
                                              .getMeetingsItemsModel
                                              .itemsDetails![0]
                                              .fileApprovedNote
                                              .toString()),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) => FullScreenPdfDialog(
                                          base64String: MySingleton()
                                              .getMeetingsItemsModel
                                              .itemsDetails![0]
                                              .fileEnclosure
                                              .toString(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      color: Colors.amber.shade50,
                                      child: PdfViewerFromBase64(
                                          base64String: MySingleton()
                                              .getMeetingsItemsModel
                                              .itemsDetails![0]
                                              .fileEnclosure
                                              .toString()),
                                    ),
                                  ),

                                  // first tab bar view widget
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
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     physics: NeverScrollableScrollPhysics(),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Container(
            //           height: MediaQuery.of(context).size.height,
            //           width: MediaQuery.of(context).size.width,
            //           child: Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 8.0, right: 8.0, top: 8.0),
            //             child: Column(
            //               children: [
            //                 // give the tab bar a height [can change height to preferred height]
            //                 Container(
            //                   height: 40,
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey[300],
            //                     borderRadius: BorderRadius.circular(
            //                       25.0,
            //                     ),
            //                   ),
            //                   child: TabBar(
            //                     controller: _tabController,
            //                     indicator: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(
            //                         20.0,
            //                       ),
            //                       color: Colors.deepOrange,
            //                     ),
            //                     labelColor: Colors.white,
            //                     unselectedLabelColor: Colors.white,
            //                     tabs: [
            //                       // first tab [you can add an icon using the icon property]
            //                       Tab(
            //                         child: Text(
            //                           'Approval',
            //                           style: TextStyle(
            //                               color: Colors.white,
            //                               fontWeight: FontWeight.w300),
            //                         ),
            //                       ),
            //
            //                       // second tab [you can add an icon using the icon property]
            //                       Tab(
            //                         child: Text(
            //                           'Attachments',
            //                           style: TextStyle(
            //                               color: Colors.white,
            //                               fontWeight: FontWeight.w300),
            //                         ),
            //                         //  text: 'Draft List',
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 // tab bar view here
            //                 Expanded(
            //                   child: TabBarView(
            //                     controller: _tabController,
            //                     children: [
            //                       // first tab bar view widget
            //                       PdfViewerFromBase64(
            //                           base64String: MySingleton()
            //                               .getMeetingsItemsModel
            //                               .itemsDetails![0]
            //                               .fileApprovedNote
            //                               .toString()),
            //                       PdfViewerFromBase64(
            //                           base64String: MySingleton()
            //                               .getMeetingsItemsModel
            //                               .itemsDetails![0]
            //                               .fileEnclosure
            //                               .toString()),
            //
            //                       // second tab bar view widget
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
