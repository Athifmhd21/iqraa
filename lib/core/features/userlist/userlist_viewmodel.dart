import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserListViewModel extends ChangeNotifier {
  List users = [];
  bool isLoading = true;
  String? errorMessage;

  Future<void> fetchUsers() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
      );

      if (response.statusCode == 200) {
        users = jsonDecode(response.body);
      } else {
        errorMessage = "Failed to load users";
      }
    } catch (e) {
      errorMessage = "Something went wrong. Check your internet.";
    }

    isLoading = false;
    notifyListeners();
  }
}
