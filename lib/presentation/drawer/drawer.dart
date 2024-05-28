import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/global/global.dart';
import '../../core/services/base_service.dart';

class AppDrawer extends StatefulWidget {
  final String selectItemName;

  const AppDrawer({ key, required this.selectItemName}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                height: 200,
              ),
              SizedBox(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: -150,
                      right: -10,
                      top: -800,
                      bottom: 80,
                      child: SizedBox(
                        height: 800,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                          margin: const EdgeInsets.all(0),
                          color: Colors.black.withOpacity(0.06),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -200,
                      right: 110,
                      top: -50,
                      bottom: -5,
                      child: SizedBox(
                        height: 400,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                          margin: const EdgeInsets.all(0),
                          color: Colors.black.withOpacity(0.06),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CircleAvatar(
                        radius: 25.h + 25.v,
                        backgroundColor: Colors.transparent, // Optional background color for clarity
                        backgroundImage: NetworkImage(
                          BaseService.mediaUrl + "/profile/" + GlobalData.prefs.getString('user_pic')!,
                        ),// Ensure sharp circle edge
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(GlobalData.prefs.getString('full_name')!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  GlobalData.prefs.getString('role')!,
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).textTheme.titleLarge!.color,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  GlobalData.prefs.getString('user_uc')!,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: <Widget>[
                        widget.selectItemName == 'Home' ? selectedData() : const SizedBox(),
                        Icon(
                          Icons.home,
                          size: 28,
                          color: widget.selectItemName == 'Home' ? Theme.of(context).primaryColor : Theme.of(context).disabledColor.withOpacity(0.2),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('Home',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.titleLarge!.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                          children: <Widget>[
                            widget.selectItemName == 'Setting' ? selectedData() : const SizedBox(),
                            Icon(
                              Icons.ac_unit,
                              size: 20,
                              color: widget.selectItemName == 'Setting'
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).disabledColor.withOpacity(0.2),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Setting',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.titleLarge!.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        GlobalData.prefs.clear();
                        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcomeScreen, (Route<dynamic> route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
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
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget selectedData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 28,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
