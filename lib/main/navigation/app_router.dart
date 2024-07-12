import 'package:emantrimandal/main/navigation/route_paths.dart';
import 'package:emantrimandal/presentation/screens/downloadMeetingItemsScreen/download_meeting_items_screen.dart';
import 'package:emantrimandal/presentation/screens/errorScreen/error_screen.dart';
import 'package:emantrimandal/presentation/screens/itemDetailsScreen/item_details_screen.dart';
import 'package:emantrimandal/presentation/screens/mantriDashboardScreen/mantri_dashboard_screen.dart';
import 'package:emantrimandal/presentation/screens/mantriInfoScreen/mantri_info_screen.dart';
import 'package:emantrimandal/presentation/screens/splashScreen/splash_screen.dart';
import 'package:emantrimandal/presentation/screens/vedioCallScreen/vedio_call_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //1
      case RoutePaths.splashScreen:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
          settings: const RouteSettings(name: RoutePaths.splashScreen),
        );

      //2
      case RoutePaths.mantriInfoScreen:
        return CupertinoPageRoute(
          builder: (context) => const MantriInfoScreen(),
          settings: const RouteSettings(name: RoutePaths.mantriInfoScreen),
        );

      //3
      case RoutePaths.mantriDashboardScreen:
        return CupertinoPageRoute(
          builder: (context) => const MantriDashboardScreen(),
          settings: const RouteSettings(name: RoutePaths.mantriDashboardScreen),
        );


      //4
      case RoutePaths.itemDetailsScreen:
        return CupertinoPageRoute(
          builder: (context) => const ItemDetailsScreen(itemId: '', deptName: '',),
          settings: const RouteSettings(name: RoutePaths.itemDetailsScreen),
        );

        //5
      case RoutePaths.downloadMeetingItemsScreen:
        return CupertinoPageRoute(
          builder: (context) => const DownloadMeetingItemsScreen(),
          settings: const RouteSettings(name: RoutePaths.downloadMeetingItemsScreen),
        );

        //6
      case RoutePaths.errorScreen:
        return CupertinoPageRoute(
          builder: (context) => const ErrorScreen(),
          settings: const RouteSettings(name: RoutePaths.errorScreen),
        );

      case RoutePaths.videoCall:
        return CupertinoPageRoute(
          builder: (context) => const VideoCallScreen(),
          settings: const RouteSettings(name: RoutePaths.videoCall),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
