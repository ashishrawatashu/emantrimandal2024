import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart' show parse;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // Assuming you're using Syncfusion PDF viewer

import '../../../core/utils/singleton.dart';

class ItemDetailsScreen extends StatefulWidget {
  final int itemIndex;

  const ItemDetailsScreen({super.key, required this.itemIndex});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("मद क्रमांक " +
            MySingleton()
                .getMeetingsItemsModel
                .itemsDetails![widget.itemIndex]
                .itemId
                .toString() +
            " का विवरण"),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "टिप्पणी",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showCommentDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          color: Colors.amber.shade50,
                          padding: const EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            child: HtmlWidget(parse(MySingleton()
                                .getMeetingsItemsModel
                                .itemsDetails![widget.itemIndex]
                                .itemsDetails
                                .toString())
                                .documentElement!
                                .text),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "प्रपत्र",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
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
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        20.0,
                                      ),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.deepOrange,
                                      ),
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
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                  horizontal: 80),
                                              child: Text(
                                                'अनुमोदन',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                  horizontal: 80),
                                              child: Text(
                                                'संलग्नक',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showPdfDialog(MySingleton()
                                                .getMeetingsItemsModel
                                                .itemsDetails![widget.itemIndex]
                                                .fileApprovedNote
                                                .toString());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            color: Colors.amber.shade50,
                                            child: SfPdfViewer.memory(
                                              base64Decode(MySingleton()
                                                  .getMeetingsItemsModel
                                                  .itemsDetails![
                                              widget.itemIndex]
                                                  .fileApprovedNote
                                                  .toString()),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showPdfDialog(MySingleton()
                                                .getMeetingsItemsModel
                                                .itemsDetails![widget.itemIndex]
                                                .fileEnclosure
                                                .toString());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            color: Colors.amber.shade50,
                                            child: SfPdfViewer.memory(
                                              base64Decode(MySingleton()
                                                  .getMeetingsItemsModel
                                                  .itemsDetails![
                                              widget.itemIndex]
                                                  .fileEnclosure
                                                  .toString()),
                                            ),
                                          ),
                                        ),
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
          ],
        ),
      ),
    );
  }

  void showCommentDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                color: Colors.amber.shade50,
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: HtmlWidget(
                    parse(MySingleton()
                        .getMeetingsItemsModel
                        .itemsDetails![widget.itemIndex]
                        .itemsDetails
                        .toString())
                        .documentElement!
                        .text, // Set to true if you want to enable web view for external links
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showPdfDialog(String pdfString) {
    print("Base64 String: $pdfString"); // Debugging statement

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.amber.shade50,
                child: SfPdfViewer.memory(
                  base64Decode(pdfString),
                ),
              ),
              Positioned(
                right: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
