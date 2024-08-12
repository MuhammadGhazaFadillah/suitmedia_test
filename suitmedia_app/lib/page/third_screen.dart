import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_app/page/second_screen.dart';
import 'package:suitmedia_app/providers/user_provider.dart';


class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (userProvider.users.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollEndNotification) {
                  if (userProvider.users.length < 12) {
                    Provider.of<UserProvider>(context, listen: false).fetchUsers();
                  }
                }
                return false;
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<UserProvider>(context, listen: false).fetchUsers();
                },
                child: ListView.builder(
                  itemCount: userProvider.users.length,
                  itemBuilder: (context, index) {
                    final user = userProvider.users[index];
                    return ListTile(
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      onTap: () {
                        Provider.of<UserProvider>(context, listen: false).selectUser(user);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen()),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}