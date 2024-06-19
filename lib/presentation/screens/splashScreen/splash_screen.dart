import 'package:emantrimandal/core/constants/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/singleton.dart';
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
        backgroundColor: Colors.white,
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    ImagesPath.eCabinetLogo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5,bottom: 5),
                  width: 600,
                  height: 1,
                  color: Colors.deepOrange,
                ),
                Text("ई-मंत्रिमण्डल प्रणाली राष्ट्रीय सूचना विज्ञान केंद्र(NIC) के द्वारा, राज्य सरकार के सहयोग से,\n अभिकल्पित एवं विकसित किया गया है |",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.deepOrange,),textAlign: TextAlign.center,),

              ],
            ),
          );
        });

  }

}
