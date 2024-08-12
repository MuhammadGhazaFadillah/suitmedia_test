import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:suitmedia_app/models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _users = [];
  int _currentPage = 1;
  bool _isLoading = false;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$_currentPage&per_page=10'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final users = (jsonData['data'] as List).map((json) => UserModel.fromJson(json)).toList();
      _users.addAll(users);
      _currentPage++;
    }

    _isLoading = false;
    notifyListeners();
  }

  void selectUser(UserModel user) {
    // Update the selected user name in the second screen
    notifyListeners();
  }
}