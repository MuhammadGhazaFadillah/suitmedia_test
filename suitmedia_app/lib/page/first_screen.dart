import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_app/providers/palindrome_provider.dart';
import 'package:suitmedia_app/page/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _sentenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _sentenceController,
              decoration: InputDecoration(labelText: 'Sentence'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a sentence';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final palindromeProvider = Provider.of<PalindromeProvider>(context, listen: false);
                  palindromeProvider.setName(_nameController.text);
                  palindromeProvider.setSentence(_sentenceController.text);
                  palindromeProvider.checkPalindrome(_sentenceController.text);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(palindromeProvider.isPalindrome ? 'Is Palindrome' : 'Not Palindrome'),
                    ),
                  );
                }
              },
              child: Text('Check'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
               