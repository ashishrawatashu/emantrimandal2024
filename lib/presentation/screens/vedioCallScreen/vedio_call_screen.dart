import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pip_view/pip_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:window_manager/window_manager.dart';
import '../../../core/constants/images_path.dart';
import '../mantriDashboardScreen/mantri_dashboard_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();


class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isLoading = true;

  // final url = 'https://www.google.com/';
  final url = 'https://meet.google.com/cye-ocig-dab';
  final _controller = WebviewController();
  final _textController = TextEditingController();
  final List<StreamSubscription> _subscriptions = [];
  late var minMax = true;


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await windowManager.ensureInitialized();
      await _controller.initialize();
      _subscriptions.add(_controller.url.listen((url) {
        _textController.text = url;
      }));

      _subscriptions
          .add(_controller.containsFullScreenElementChanged.listen((flag) {
        debugPrint('Contains fullscreen element: $flag');
        windowManager.setFullScreen(flag);
      }));

      await _controller.setBackgroundColor(Colors.transparent);
      await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      await _controller.loadUrl(url);

      if (!mounted) return;
      setState(() {});
    } on PlatformException catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Error'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Code: ${e.code}'),
                  Text('Message: ${e.message}'),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Continue'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: PIPView(
        floatingHeight: 260,
        floatingWidth: 300,
        initialCorner: PIPViewCorner.bottomRight,
        builder: (context, isFloating) {
          return Scaffold(
            resizeToAvoidBottomInset: !isFloating,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: /*isFloating ? const SizedBox() :*/ myAppBar(),
            ),
            endDrawer: Drawer(
              backgroundColor: Colors.deepOrange,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.deepOrange),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 92,
                          width: 92,
                          child: Expanded(
                            child: CircleAvatar(
                              radius: 46,
                              backgroundImage: AssetImage(
                                 ImagesPath.userImg,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'माननीय मंत्रिमहोदय',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('My Profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Change Mobile Number'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Platform.isWindows
                  ? Stack(
                children: [
                  compositeView(),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          minMax = true;
                        });
                        PIPView.of(context)!.presentBelow(MantriDashboardScreen());
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.deepOrange,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          ImagesPath.noteBook,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : Stack(),
                  isFloating
                      ? abc()
                      ? Center(
                    child: Container(
                      color: Colors.black26,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minMax = false;
                          });
                        },
                        child: Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      height:
                      MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                      : Stack()
                      : Stack()
                ],
              )
                  : WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("VC Screen"),
      ),
    );
  }

  Widget myAppBar() {
    return AppBar(
      toolbarHeight: 80,
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      backgroundColor: Colors.deepOrange,
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36,
            ),
          ),
          /*     Image.asset(
            'assets/images/elogo.png',
            height: 54,
            width: 54,
          ),*/
          SizedBox(
            width: 16,
          ),
          Text(
            'ई-मंत्रिमंडल',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: const [
        Center(
          child: Text(
            'माननीय मंत्रिमहोदय',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.person_sharp,
          size: 48,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        /*  Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 48,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          },
        ),*/
      ],
    );
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    Webview(
                      _controller,
                      permissionRequested: _onPermissionRequested,
                    ),
                    /* StreamBuilder<LoadingState>(
                      stream: _controller.loadingState,
                      builder: (context, snapshot) {
                       return snapshot.data == LoadingState.navigationCompleted
                            ? SizedBox()
                            : CircularProgressIndicator();
                           if (snapshot.hasData &&
                            snapshot.data == LoadingState.loading) {
                          return const LinearProgressIndicator();
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _subscriptions.forEach((s) => s.cancel());
    _controller.dispose();
    super.dispose();
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          /* TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),*/
          TextButton(
            onPressed: () {
              Navigator.pop(context, WebviewPermissionDecision.allow);
            },
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    if (decision == WebviewPermissionDecision.allow) {
      setState(() {
        isLoading = false;
      });
    }
    return decision ?? WebviewPermissionDecision.none;
  }

  bool abc() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        minMax = false;
      });
    });
    return minMax;
  }
}
