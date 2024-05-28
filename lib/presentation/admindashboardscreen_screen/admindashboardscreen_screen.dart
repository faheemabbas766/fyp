import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/core/global/global.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/admindashboardscreen_provider.dart';

class AdmindashboardScreen extends StatefulWidget {
  const AdmindashboardScreen({Key? key}) : super(key: key);

  @override
  AdmindashboardScreenState createState() => AdmindashboardScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdmindashboardscreenProvider(),
      child: const AdmindashboardScreen(),
    );
  }
}

class AdmindashboardScreenState extends State<AdmindashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
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
        body: Column(
          children: [
            const Spacer(flex: 10),
            Text(
              'Welcome to Admin Dashboard',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 10),
            RotationTransition(
              turns: _animation,
              child: Container(
                width: 200.v,
                child: RotationTransition(
                  turns: _animation,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPTreatmanet1,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 10),
            Text(
              GlobalData.prefs.getString('full_name')!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 10),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.report,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                        onPressed: () {
                          NavigatorService.pushNamed(
                            AppRoutes.adminreportsScreen,
                          );
                        },
                      ),
                      Text(
                        "All Reports",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.security_update_good_rounded,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                        onPressed: () {
                          NavigatorService.pushNamed(
                            AppRoutes.adminManageUsersScreen,
                          );
                        },
                      ),
                      Text(
                        "All Requests",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.report,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                        onPressed: () {
                          NavigatorService.pushNamed(
                            AppRoutes.adminreportsScreen,
                          );
                        },
                      ),
                      Text(
                        "Reports",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.people,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                        onPressed: () {
                          NavigatorService.pushNamed(
                            AppRoutes.adminManageUsersScreen,
                          );
                        },
                      ),
                      Text(
                        "Manage Users",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                  GlobalData.prefs.clear();
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcomeScreen, (Route<dynamic> route) => false);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.logout,
                    size: 20,
                    color: Theme.of(context).disabledColor.withOpacity(0.2),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Logout',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
