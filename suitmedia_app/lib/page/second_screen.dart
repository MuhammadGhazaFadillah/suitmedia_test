import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_app/providers/palindrome_provider.dart';
import 'package:suitmedia_app/page/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: [
          Text('Welcome'),
          Text('Name: ${Provider.of<PalindromeProvider>(context).name}'),
          Text('Selected User Name: ${Provider.of<PalindromeProvider>(context).selectedUserName}'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              );
            },
            child: Text('Choose a User'),
          ),
        ],
      ),
    );
  }
}