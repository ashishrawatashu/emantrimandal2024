import 'package:emantrimandal/core/constants/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../main/navigation/route_paths.dart';
import '../../blocs/splashBloc/splash_screen_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SplashScreenBloc>().add(GenerateTokenDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: splashBody(),
    );
  }

  Widget splashBody(){
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
        listener: (context,state){
          if(state is NavigateSplashToDownloadScreenState){
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.pushNamed(context, RoutePaths.downloadMeetingItemsScreen);
            });
          }if(state is NavigateSplashToErrorScreenState){
            Navigator.pushNamed(context, RoutePaths.errorScreen);
          }
        },
        builder: (context, state) {
          return Container(
            child: Center(
              child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RoutePaths.downloadMeetingItemsScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        ImagesPath.eCabinetLogo,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white),
              ),
            ),
          );
        });

  }

}
