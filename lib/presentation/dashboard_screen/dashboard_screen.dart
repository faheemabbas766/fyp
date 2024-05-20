import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import 'provider/dashboard_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  DashboardScreenState createState() => DashboardScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DashboardProvider(), child: DashboardScreen());
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    Provider.of<DashboardProvider>(context, listen: false).loadData(null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: Consumer<DashboardProvider>(
              builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          children: [
                            CustomElevatedButton(
                              onPressed: (){
                                provider.isShowLoading = true;
                                provider.notifier();
                                provider.loadData(GlobalData.prefs.getString('user_uc')!);
                              },
                              height: 56.v,
                              text: "UC",
                              buttonStyle: CustomButtonStyles.outlineBlack,
                              buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),),
                            SizedBox(height: 10,),
                            CustomElevatedButton(
                              onPressed: (){
                                provider.isShowLoading = true;
                                provider.notifier();
                                provider.loadData(null);
                              },
                              height: 56.v,
                              text: "ALL",
                              buttonStyle: CustomButtonStyles.outlineBlack,
                              buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),),
                          ]
                      ),
                    ),
                    SizedBox(height: 1.v),
                    provider.isShowLoading?
                    Center(child: CircularProgressIndicator())
                        :Expanded(
                      child: ListView.builder(
                        itemCount: provider.allPosts.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.v),
                                      decoration: AppDecoration.outlineOnErrorContainer1,
                                      child: GestureDetector(
                                        onTap: (){
                                          if(provider.allPosts[index].userCNIC == GlobalData.prefs.getString('cnic')){
                                            NavigatorService.pushNamed(
                                              AppRoutes.profileScreen,
                                            );
                                          }else{
                                            GlobalData.profileCnic = provider.allPosts[index].userCNIC;
                                            NavigatorService.pushNamed(
                                              AppRoutes.visitProfileScreen,
                                            );
                                          }
                                        },
                                        child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 15.h + 15.v,
                                                backgroundColor: Colors.transparent, // Optional background color for clarity
                                                backgroundImage: NetworkImage(
                                                  BaseService.mediaUrl + "/profile/" + provider.allPosts[index].userPicture,
                                                ),// Ensure sharp circle edge
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(left: 12.h),
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width/3,
                                                              child: Text(
                                                                provider.allPosts[index].userName,
                                                                style: CustomTextStyles.titleSmallRoboto,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            Container(
                                                                width: MediaQuery.of(context).size.height / 6.3,
                                                                child: Text(GlobalData.timeAgo(provider.allPosts[index].postDate))),
                                                            DropdownButton2<String>(
                                                              isExpanded: true,
                                                              underline: SizedBox.shrink(),
                                                              items: Provider.of<DashboardProvider>(context, listen: false).items
                                                                  .map((String item) => DropdownMenuItem<String>(
                                                                value: item,
                                                                child: Text(
                                                                  item,
                                                                  style: const TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black,
                                                                  ),
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ))
                                                                  .toList(),
                                                              value: null,
                                                              onChanged: (String? value) {
                                                                if(value == 'Report'){
                                                                  GlobalData.postId = provider.allPosts[index].postId.toString();
                                                                  showDialog(
                                                                      context: context,
                                                                      builder: (context) => Provider.of<DashboardProvider>(context, listen: false).buildAutoLayoutVertical(context));
                                                                }
                                                              },
                                                              buttonStyleData: ButtonStyleData(
                                                                width: 30,
                                                              ),
                                                              iconStyleData: const IconStyleData(
                                                                icon: Icon(
                                                                  Icons.more_horiz_outlined,
                                                                ),
                                                                iconSize: 30,
                                                                iconEnabledColor: Colors.black,
                                                                iconDisabledColor: Colors.black,
                                                              ),
                                                              dropdownStyleData: DropdownStyleData(
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(14),
                                                                  color: Colors.white,
                                                                ),
                                                                offset: const Offset(-20, 0),
                                                                scrollbarTheme: ScrollbarThemeData(
                                                                  radius: const Radius.circular(40),
                                                                  thickness: WidgetStateProperty.all<double>(6),
                                                                  thumbVisibility: WidgetStateProperty.all<bool>(true),
                                                                ),
                                                              ),
                                                              menuItemStyleData: const MenuItemStyleData(
                                                                height: 40,
                                                                padding: EdgeInsets.only(left: 14, right: 14),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width/3,
                                                              child: Text(
                                                                provider.allPosts[index].accountType,
                                                                style: CustomTextStyles.titleSmallRoboto,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            InkWell(
                                                                onTap: () async {
                                                                  if (await provider.FollowById(provider.allPosts[index].userCNIC)) {
                                                                    provider.allPosts[index].followed = !provider.allPosts[index].followed;
                                                                    GlobalData.showSnackBar(
                                                                        provider.allPosts[index].followed ? "Following" : 'Unfollowed', context);
                                                                    provider.notifier();
                                                                  }
                                                                },
                                                                child: Text(provider.allPosts[index].followed ? "Following" : 'Follow+',style: CustomTextStyles.titleSmallRobotoSemiBold,)),
                                                            SizedBox(
                                                              width: MediaQuery.of(context).size.height / 7.35,
                                                              child: Align(
                                                                  alignment: Alignment.centerRight,
                                                                  child: Text(provider.allPosts[index].postUC,style: CustomTextStyles.titleSmallRobotoSemiBold,)),
                                                            ),

                                                          ],
                                                        ),
                                                      ])),
                                            ]),
                                      )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          GlobalData.profileCnic = provider.allPosts[index].politician_id;
                                          NavigatorService.pushNamed(
                                            AppRoutes.visitProfileScreen,
                                          );
                                        },
                                        child: Text("@"+GlobalData.getPoliticianById(provider.allPosts[index].politician_id),
                                        style: TextStyle(color: Colors.blue,fontSize: 18),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Linkify(
                                          text: provider.allPosts[index].postText?? '',
                                          softWrap: true,
                                          maxLines: 20,
                                          style: CustomTextStyles.bodyMediumPavanamff000000,
                                          linkStyle: TextStyle(color: Colors.blue),
                                          onOpen: (link) async {
                                            if (await canLaunch(link.url)) {
                                              await launch(link.url);
                                            } else {
                                              throw 'Could not launch ${link.url}';
                                            }
                                          },
                                        ),
                                      ),
                                      provider.allPosts[index].postImage!=null?Container(
                                        width: double.maxFinite,
                                        child: CustomImageView(
                                          height: 300,
                                          fit: BoxFit.cover,
                                          imagePath: BaseService.mediaUrl+(provider.allPosts[index].postImage??""),
                                        ),
                                      ):Container(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute space evenly
                                        children: [
                                          Row(
                                            children: [
                                              for (int i = 0; i < 5; i++)
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 1.0), // Customize the horizontal spacing here
                                                  child: GestureDetector(
                                                      onTap: (){
                                                        provider.allPosts[index].rate_score= i+1;
                                                        provider.notifier();
                                                        provider.ratePost(index);
                                                      },
                                                      child: Icon(i<provider.allPosts[index].rate_score? Icons.star:Icons.star_border, color: Colors.yellow)),
                                                ),
                                              SizedBox(width: 10,),
                                              Text(provider.allPosts[index].totalRating.toString(),style: CustomTextStyles.titleLargeBlack90005),
                                            ],
                                          ),
                                          // Column(
                                          //   children: [
                                          //     IconButton(
                                          //       onPressed: () {},
                                          //       icon: Icon(Icons.thumb_up),
                                          //     ),
                                          //     Text("11.2k", style: CustomTextStyles.bodyMediumJudson),
                                          //   ],
                                          // ),
                                          // Column(
                                          //   children: [
                                          //     IconButton(
                                          //       onPressed: () {},
                                          //       icon: Icon(Icons.thumb_down),
                                          //     ),
                                          //     Text("11.2k", style: CustomTextStyles.bodyMediumJudson),
                                          //   ],
                                          // ),
                                          IconButton(
                                            onPressed: () {
                                              GlobalData.postId = provider.allPosts[index].postId.toString();
                                              NavigatorService.pushNamed(
                                                AppRoutes.commentScreen,
                                              );
                                            },
                                            icon: Icon(Icons.comment_sharp),
                                          ),
                                          Expanded(
                                              child: Text(provider.allPosts[index].recentComment??'',
                                                style: CustomTextStyles.bodyMediumJudson,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              color: appTheme.black90005,
                              indent: 6.h,
                              endIndent: 6.h,
                            ),
                          ],
                        ),),
                    ),
                  ]
              ),)
        )
    );
  }
}
