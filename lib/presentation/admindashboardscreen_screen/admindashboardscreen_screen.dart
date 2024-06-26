import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/core/global/global.dart';
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade200, Theme.of(context).primaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                'Welcome to Admin Dashboard',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              RotationTransition(
                turns: _animation,
                child: Container(
                  width: 200,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPTreatmanet1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                GlobalData.prefs.getString('full_name')!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20.0),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildDashboardCard(
                      icon: Icons.report,
                      label: "All Reports",
                      onPressed: () {
                        NavigatorService.pushNamed(AppRoutes.adminreportsScreen);
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.flag,
                      label: "All Parties",
                      onPressed: () {
                        NavigatorService.pushNamed(AppRoutes.allPartiesScreen);
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.people,
                      label: "Manage Users",
                      onPressed: () {
                        NavigatorService.pushNamed(AppRoutes.adminManageUsersScreen);
                      },
                    ),
                    _buildDashboardCard(
                      icon: Icons.logout,
                      label: "Log Out",
                      onPressed: () {
                        GlobalData.prefs.clear();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.welcomeScreen,
                              (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
