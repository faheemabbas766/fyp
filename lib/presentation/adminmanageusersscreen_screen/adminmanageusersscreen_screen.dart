import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/presentation/adminmanageusersscreen_screen/provider/adminmanageusersscreen_provider.dart';

class AdminManageUsersScreen extends StatefulWidget {
  const AdminManageUsersScreen({Key? key}) : super(key: key);

  @override
  AdminManageUsersScreenState createState() => AdminManageUsersScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminManageUsersScreenProvider(),
      child: const AdminManageUsersScreen(),
    );
  }
}

class AdminManageUsersScreenState extends State<AdminManageUsersScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> users = [
    {"name": "asad_mehmood", "role": "mma", "status": "active"},
    {"name": "farah_hassan", "role": "mpa", "status": "inactive"},
    {"name": "zahid_nawaz", "role": "journalist", "status": "active2"},
    {"name": "faheem_abbas", "role": "mpa", "status": "inactive"},
    {"name": "mohsin_raza", "role": "journalist", "status": "active2"},
    {"name": "ali_jamil", "role": "mpa", "status": "inactive"},
    {"name": "iqrar_ul_hassan", "role": "journalist", "status": "active2"},
    {"name": "imran_khan", "role": "mpa", "status": "inactive"},
    {"name": "nawaz_sharif", "role": "mpa", "status": "inactive"},
    {"name": "saad", "role": "mpa", "status": "inactive"},
  ];

  late List<Map<String, String>> filteredUsers;

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
    _searchController.addListener(() {
      filterUsers();
    });
  }

  void filterUsers() {
    setState(() {
      filteredUsers = users
          .where((user) =>
          user["name"]!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manage Users"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              NavigatorService.pushNamed(AppRoutes.adminreportsScreen);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search users",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = filteredUsers[index];
                    return UserCard(
                      name: user["name"]!,
                      role: user["role"]!,
                      status: user["status"]!,
                      onTap: () {
                        NavigatorService.pushNamed(AppRoutes.adminUserDetailScreen);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String role;
  final String status;
  final VoidCallback onTap;

  const UserCard({
    required this.name,
    required this.role,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Role: $role\nStatus: $status"),
        trailing: TextButton(
          child: Text(
            "View Details",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
