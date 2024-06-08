import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/presentation/addpost_screen/addpost_screen.dart';
import 'package:fyp/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:fyp/presentation/profile_screen/profile_screen.dart';
import 'package:fyp/presentation/search_screen_container_screen/search_screen_container_screen.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import '../../core/app_export.dart';
import '../drawer/drawer.dart';
import 'provider/bottom_app_bar_provider.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({Key? key}) : super(key: key);
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BottomAppBarScreenProvider(), child: BottomAppBarScreen());
  }
  @override
  State<BottomAppBarScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomAppBarScreen> {
  final _pageController = PageController(initialPage: 0);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 4;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  final List<Widget> bottomBarPages = [
    const DashboardScreen(),
    const SearchScreenContainerScreen(),
    const AddPostScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Exit App?'),
                content: const Text('Do you want to exit the app?'),
                actions: [
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    text: 'No',
                  ),
                  SizedBox(height: 20,),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    text:'Yes',
                  ),
                ],
              );
            },
          );
        },
        child:Scaffold(
          key: _scaffoldKey,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: (){
            _scaffoldKey.currentState!.openDrawer();
          },child: Icon(Icons.account_circle_outlined),),
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75 < 400 ? MediaQuery.of(context).size.width * 0.72 : 350,
            child: const Drawer(
              child: AppDrawer(
                selectItemName: 'Home',
              ),
            ),
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
          ),
          bottomNavigationBar: (bottomBarPages.length <= maxCount)
              ? AnimatedNotchBottomBar(
            notchBottomBarController: _controller,
            color: Colors.greenAccent,
            showLabel: false,
            kBottomRadius: 10,
            durationInMilliSeconds: 300,
            bottomBarItems: [
              const BottomBarItem(
                inActiveItem: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeItem: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                itemLabel: 'Dashboard',
              ),
              const BottomBarItem(
                inActiveItem: Column(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
                activeItem: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                itemLabel: 'Search',
              ),
              const BottomBarItem(
                inActiveItem: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                activeItem: Icon(
                  Icons.add,
                  color: Colors.red,
                ),
                itemLabel: 'Add Post',
              ),
              const BottomBarItem(
                inActiveItem: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                activeItem: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                itemLabel: 'Profile',
              ),
            ],
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
            kIconSize: 24.0,
          ) : null,
        )
    );
  }
}