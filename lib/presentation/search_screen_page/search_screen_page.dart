import 'package:flutter/material.dart';
import 'package:fyp/widgets/custom_search_view.dart';
import 'package:fyp/core/app_export.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import 'provider/search_screen_provider.dart';

class SearchScreenPage extends StatefulWidget {
  const SearchScreenPage({Key? key}) : super(key: key);

  @override
  SearchScreenPageState createState() => SearchScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchScreenProvider(), child: SearchScreenPage());
  }
}

class SearchScreenPageState extends State<SearchScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 19.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 24.h, right: 24.h),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Selector<SearchScreenProvider, TextEditingController?>(
                                                selector: (context, provider) => provider.searchController,
                                                builder: (context, searchController, child) {
                                                  return CustomSearchView(
                                                      controller: searchController,
                                                      hintText: "Enter here to search...",
                                                      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
                                                      borderDecoration: SearchViewStyleHelper.fillGray,
                                                      fillColor: appTheme.gray200
                                                  );
                                                }
                                            )
                                        )
                                      ]
                                  )
                              )
                          ),
                          Consumer<SearchScreenProvider>(
                              builder: (context, provider, child) => Expanded(
                                  child: ListView.builder(
                                      itemCount: provider.searchList.length,
                                      itemBuilder: (context, index) {
                                        final politician = provider.searchList[index];
                                        return InkWell(
                                          onTap: (){
                                            if(politician.politicianCNIC == GlobalData.prefs.getString('cnic')){
                                              NavigatorService.pushNamed(
                                                AppRoutes.profileScreen,
                                              );
                                            }else{
                                              GlobalData.profileCnic = politician.politicianCNIC;
                                              NavigatorService.pushNamed(
                                                AppRoutes.visitProfileScreen,
                                              );
                                            }
                                          },
                                          child: Column(
                                              children: [
                                                SizedBox(height: 22.v),
                                                Padding(
                                                    padding: EdgeInsets.only(left: 18.h),
                                                    child: Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 15.h + 15.v,
                                                            backgroundColor: Colors.transparent, // Optional background color for clarity
                                                            backgroundImage: NetworkImage(
                                                              BaseService.mediaUrl + "/profile/" + politician.userPic,
                                                            ),// Ensure sharp circle edge
                                                          ),
                                                          Padding(
                                                              padding: EdgeInsets.only(left: 14.h, top: 9.v, bottom: 10.v),
                                                              child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                        politician.userFullName,
                                                                        style: theme.textTheme.bodyLarge
                                                                    ),
                                                                    Text(
                                                                        politician.politicianParty,
                                                                        style: theme.textTheme.bodySmall
                                                                    )
                                                                  ]
                                                              )
                                                          )
                                                        ]
                                                    )
                                                )
                                              ]
                                          ),
                                        );
                                      }
                                  )
                              )
                          ),
                          SizedBox(height: 5.v)
                        ]
                    )
                )
            )
        )
    );
  }
}
