import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/presentation/comment_screen/provider/comment_provider.dart';
import 'package:fyp/presentation/dashboard_screen/provider/dashboard_provider.dart';
import 'package:fyp/presentation/login_screen/provider/login_provider.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          // Use MultiProvider for multiple providers
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ChangeNotifierProvider(create: (_) => LoginProvider()),
            ChangeNotifierProvider(create: (_) => DashboardProvider()),
            ChangeNotifierProvider(create: (_) => CommentProvider()),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                theme: theme, // Use theme from ThemeProvider
                title: 'Politician Portal',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splashScreen,
                routes: AppRoutes.routes,
                // home: BottomAppBarScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
