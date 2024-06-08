import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/core/services/base_service.dart';
import 'package:fyp/presentation/admindashboardscreen_screen/admindashboardscreen_screen.dart';
import 'package:fyp/presentation/switchaccount_screen/models/switchaccount_model.dart';
import 'package:fyp/presentation/welcome_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/global/global.dart';
import '../../data/models/politician_model.dart';
import '../bottom_app_bar/bottom_app_bar_screen.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _loadData();
    _controller = AnimationController(
      duration: const Duration(
          seconds: 10), // Increase the duration for slower rotation
      vsync: this,
    )..repeat(); // Don't set reverse to true to rotate continuously
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear, // Use linear curve for constant speed
    );
  }

  Future<void> _loadData() async {
    GlobalData.prefs = await SharedPreferences.getInstance();
    if (GlobalData.prefs.getString('cnic') == null) {
      GlobalData.allPoliticianList = (await BaseService.postRequest('Main/AllPolitician', null)).map<Politician>((json) => Politician.fromJson(json)).toList();
      GlobalData.parties = (await BaseService.postRequest('Main/AllParties', null)).map<Party>((json) => Party.fromJson(json)).toList();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } else {
      GlobalData.allPoliticianList = (await BaseService.postRequest('Main/AllPolitician', null)).map<Politician>((json) => Politician.fromJson(json)).toList();
      GlobalData.parties = (await BaseService.postRequest('Main/AllParties', null)).map<Party>((json) => Party.fromJson(json)).toList();
      if(GlobalData.prefs.getString('role') == "Admin"){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdmindashboardScreen()),
        );
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomAppBarScreen()),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 24.v,
          ),
          child: Column(
            children: [
              Spacer(
                flex: 59,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250.v,
                    child: RotationTransition(
                      turns: _animation,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgPTreatmanet1,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 40,
              ),
              Text(
                "Launching",
                style: CustomTextStyles.bodyMediumInterBluegray400,
              ),
              Text(
                "Politician Portal",
                style: CustomTextStyles.titleLargeInterBluegray400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
