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
    // print(MySingleton().getMeetingsItemsModel.itemsDetails![0].fileApprovedNote.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("मद क्रमांक "+MySingleton().getMeetingsItemsModel.itemsDetails![0].itemId.toString()+" का विवरण"),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("टिप्पणी",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => FullScreenTextDialog(
                            // text: MySingleton()
                            //     .getMeetingsItemsModel
                            //     .itemsDetails![0]
                            //     .itemsDetails
                            //     .toString(),
                            text: "अगर आप भी मोबाइल से हिंदी भाषा में किसी अपने को कोई मैसेज भेजना चाहते हैं तो अब ये आसानी से ऐसा किया जा सकेगा। इसके लिए आप अक्सर इंटरनेट पर जमकर सर्फिंग करते हैं, ताकि हिंदी की-बोर्ड ऐप के ऑप्शन्स मिल सकें। हालांकि, हिंदी की-बोर्ड पर टाइपिंग की काफी दिक्कत होती है। ऐसे में आपनी इस रिपोर्ट में हम आपको कुछ खास की-बोर्ड ऐप के बारे में बताने वाले हैं, जिनकी मदद से आप आसानी से किसी भी अपने को हिंदी में टेक्स्ट मैसेज भेज सकते हैं।",
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
                            // child: Html(
                            //   data: MySingleton()
                            //         .getMeetingsItemsModel
                            //         .itemsDetails![0]
                            //         .itemsDetails
                            //         .toString(),
                            // ),
                            child: Text("अगर आप भी मोबाइल से हिंदी भाषा में किसी अपने को कोई मैसेज भेजना चाहते हैं तो अब ये आसानी से ऐसा किया जा सकेगा। इसके लिए आप अक्सर इंटरनेट पर जमकर सर्फिंग करते हैं, ताकि हिंदी की-बोर्ड ऐप के ऑप्शन्स मिल सकें। हालांकि, हिंदी की-बोर्ड पर टाइपिंग की काफी दिक्कत होती है। ऐसे में आपनी इस रिपोर्ट में हम आपको कुछ खास की-बोर्ड ऐप के बारे में बताने वाले हैं, जिनकी मदद से आप आसानी से किसी भी अपने को हिंदी में टेक्स्ट मैसेज भेज सकते हैं। अगर आप भी मोबाइल से हिंदी भाषा में किसी अपने को कोई मैसेज भेजना चाहते हैं तो अब ये आसानी से ऐसा किया जा सकेगा। इसके लिए आप अक्सर इंटरनेट पर जमकर सर्फिंग करते हैं, ताकि हिंदी की-बोर्ड ऐप के ऑप्शन्स मिल सकें। हालांकि, हिंदी की-बोर्ड पर टाइपिंग की काफी दिक्कत होती है। ऐसे में आपनी इस रिपोर्ट में हम आपको कुछ खास की-बोर्ड ऐप के बारे में बताने वाले हैं, जिनकी मदद से आप आसानी से किसी भी अपने को हिंदी में टेक्स्ट मैसेज भेज सकते हैं। अगर आप भी मोबाइल से हिंदी भाषा में किसी अपने को कोई मैसेज भेजना चाहते हैं तो अब ये आसानी से ऐसा किया जा सकेगा। इसके लिए आप अक्सर इंटरनेट पर जमकर सर्फिंग करते हैं, ताकि हिंदी की-बोर्ड ऐप के ऑप्शन्स मिल सकें। हालांकि, हिंदी की-बोर्ड पर टाइपिंग की काफी दिक्कत होती है। ऐसे में आपनी इस रिपोर्ट में हम आपको कुछ खास की-बोर्ड ऐप के बारे में बताने वाले हैं, जिनकी मदद से आप आसानी से किसी भी अपने को हिंदी में टेक्स्ट मैसेज भेज सकते हैं। अगर आप भी मोबाइल से हिंदी भाषा में किसी अपने को कोई मैसेज भेजना चाहते हैं तो अब ये आसानी से ऐसा किया जा सकेगा। इसके लिए आप अक्सर इंटरनेट पर जमकर सर्फिंग करते हैं, ताकि हिंदी की-बोर्ड ऐप के ऑप्शन्स मिल सकें। हालांकि, हिंदी की-बोर्ड पर टाइपिंग की काफी दिक्कत होती है। ऐसे में आपनी इस रिपोर्ट में हम आपको कुछ खास की-बोर्ड ऐप के बारे में बताने वाले हैं, जिनकी मदद से आप आसानी से किसी भी अपने को हिंदी में टेक्स्ट मैसेज भेज सकते हैं।"),
                          ),
                    
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("प्रपत्र",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics:  NeverScrollableScrollPhysics(),
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
                                                'अनुमोदन',
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
                                                'संलग्नक',
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
                ],
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
