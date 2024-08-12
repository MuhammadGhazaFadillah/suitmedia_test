import 'package:flutter/material.dart';

class PalindromeProvider with ChangeNotifier {
  String _name = '';
  String _sentence = '';
  bool _isPalindrome = false;
  String _selectedUserName = '';

  String get name => _name;
  String get sentence => _sentence;
  bool get isPalindrome => _isPalindrome;
  String get selectedUserName => _selectedUserName;

  bool checkIfPalindrome(String sentence) {
    final reversedSentence = sentence.split('').reversed.join('');
    return sentence.toLowerCase() == reversedSentence.toLowerCase();
  }

  void checkPalindrome(String sentence) {
    _isPalindrome = checkIfPalindrome(sentence);
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSentence(String sentence) {
    _sentence = sentence;
    notifyListeners();
  }

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }
}