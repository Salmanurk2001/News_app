import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/News_App/model/newsmodel.dart';



class SearchScreenController with ChangeNotifier {
  NewsApp? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=d0afd1b4a9754848ae0a1122c900f6c7");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsApp.fromJson(decodedData);
      } else {
        print("Api failed");
        // Handle the failure case as needed.
      }
    } catch (e) {
      print("Error: $e");
      // Handle the error case as needed.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
