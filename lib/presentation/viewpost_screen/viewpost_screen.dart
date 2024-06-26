import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/presentation/viewpost_screen/provider/viewpost_provider.dart';
import 'package:fyp/presentation/visitprofile_screen/models/visitprofile_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import '../dashboard_screen/provider/dashboard_provider.dart';
class ViewPostScreen extends StatefulWidget {
  ViewPostScreen({required this.postData, required this.index});
  final VisitProfileModel postData;
  final  index;

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text("Post Details"),),
      body: Expanded(
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.v),
                        decoration: AppDecoration.outlineOnErrorContainer1,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 15.h + 15.v,
                                  backgroundColor: Colors.transparent, // Optional background color for clarity
                                  backgroundImage: NetworkImage(
                                    BaseService.mediaUrl + "/profile/" + widget.postData.userPosts[widget.index].userPicture,
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
                                                  widget.postData.userPosts[widget.index].userName,
                                                  style: CustomTextStyles.titleSmallRoboto,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context).size.height / 6.3,
                                                  child: Text(GlobalData.timeAgo(widget.postData.userPosts[widget.index].postDate))),
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
                                                    GlobalData.postId = widget.postData.userPosts[widget.index].postId.toString();
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
                                                  widget.postData.userPosts[widget.index].accountType,
                                                  style: CustomTextStyles.titleSmallRoboto,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              GlobalData.prefs.getString('cnic')!=widget.postData.userPosts[widget.index].userCnic?
                                              InkWell(
                                                  onTap: () async {
                                                    if (await Provider.of<DashboardProvider>(context, listen: false).FollowById(widget.postData.userPosts[widget.index].userCnic)) {
                                                      widget.postData.userPosts[widget.index].followed = !widget.postData.userPosts[widget.index].followed;
                                                      GlobalData.showSnackBar(
                                                          widget.postData.userPosts[widget.index].followed ? "Following" : 'Unfollowed', context);
                                                      Provider.of<DashboardProvider>(context, listen: false).notifier();
                                                    }
                                                  },
                                                  child: Text(widget.postData.userPosts[widget.index].followed ? "Following" : 'Follow+',style: CustomTextStyles.titleSmallRobotoSemiBold,))
                                                  :SizedBox(
                                                width: MediaQuery.of(context).size.height / 15.40,),
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
                            GlobalData.profileCnic = widget.postData.userPosts[widget.index].politicianId;
                            NavigatorService.pushNamed(
                              AppRoutes.visitProfileScreen,
                            );
                          },
                          child: Text("@"+GlobalData.getPoliticianById(widget.postData.userPosts[widget.index].politicianId),
                            style: TextStyle(color: Colors.blue,fontSize: 20),),
                        ),
                        Linkify(
                          text: widget.postData.userPosts[widget.index].postText?? '',
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
                        widget.postData.userPosts[widget.index].postImage!=null?Container(
                          width: double.maxFinite,
                          child: CustomImageView(
                            height: 300,
                            fit: BoxFit.cover,
                            imagePath: BaseService.mediaUrl+(widget.postData.userPosts[widget.index].postImage??""),
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
                                          widget.postData.userPosts[widget.index].rateScore= i+1;
                                          Provider.of<ViewPostProvider>(context, listen: false).ratePost(widget.postData.userPosts[widget.index].postId,i+1 );
                                          setState(() {

                                          });
                                        },
                                        child: Icon(i<widget.postData.userPosts[widget.index].rateScore? Icons.star:Icons.star_border, color: Colors.yellow)),
                                  ),
                                SizedBox(width: 10,),
                                Text(widget.postData.userPosts[widget.index].totalRating.toString(),style: CustomTextStyles.titleLargeBlack90005),
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
                                GlobalData.postId = widget.postData.userPosts[widget.index].postId.toString();
                                NavigatorService.pushNamed(
                                  AppRoutes.commentScreen,
                                );
                              },
                              icon: Icon(Icons.comment_sharp),
                            ),
                            Expanded(
                                child: Text(widget.postData.userPosts[widget.index].recentComment??'',
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
              Expanded(child: SizedBox())
            ],
          )
      ),
    );
  }
}