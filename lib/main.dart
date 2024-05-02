import 'package:emantrimandal/presentation/blocs/itemsBloc/items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/splashBloc/splash_screen_bloc.dart';
import 'package:emantrimandal/presentation/blocs/departmentItemListBloc/department_item_list_bloc.dart';
import 'package:emantrimandal/presentation/blocs/downloadMeetingItemsBloc/download_meeting_items_bloc.dart';
import 'package:emantrimandal/presentation/blocs/itemDetailsBloc/item_details_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriDashboardBloc/mantri_dashboard_bloc.dart';
import 'package:emantrimandal/presentation/blocs/mantriInfoBloc/mantri_info_bloc.dart';
import 'package:emantrimandal/core/di/injection.dart' as I;
import 'package:emantrimandal/main/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/inject.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  I.configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => I.getIt<SplashScreenBloc>(),
        ),
        BlocProvider(
          create: (_) => I.getIt<ItemDetailsBloc>(),
        ),
        BlocProvider(
          create: (_) => I.getIt<MantriDashboardBloc>(),
        ),
        BlocProvider(
          create: (_) => I.getIt<MantriInfoBloc>(),
        ),
        BlocProvider(
          create: (_) => I.getIt<DepartmentItemListBloc>(),
        ),
        BlocProvider(
          create: (_) => I.getIt<DownloadMeetingItemsBloc>(),
        ),
        BlocProvider(
          create: (_) => I.getIt<ItemsBloc>(),
        ),
      ],
      child: App(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:pip_view/pip_view.dart';
//
// void main() => runApp(ExampleApp());
//
// class ExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return PIPView(
//       builder: (context, isFloating) {
//         return Scaffold(
//           resizeToAvoidBottomInset: !isFloating,
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Text('This page will float!'),
//                   MaterialButton(
//                     color: Theme.of(context).primaryColor,
//                     child: Text('Start floating!'),
//                     onPressed: () {
//                       PIPView.of(context)!.presentBelow(BackgroundScreen());
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class BackgroundScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         automaticallyImplyLeading: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text('This is the background page!'),
//               Text('If you tap on the floating screen, it stops floating.'),
//               Text('Navigation works as expected.'),
//               MaterialButton(
//                 color: Theme.of(context).primaryColor,
//                 child: Text('Push to navigation'),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => NavigatedScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NavigatedScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Navigated Screen'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text('This is the page you navigated to.'),
//               Text('See how it stays below the floating page?'),
//               Text('Just amazing!'),
//               Spacer(),
//               Text('It also avoids keyboard!'),
//               TextField(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }