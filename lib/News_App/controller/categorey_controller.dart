import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_project/News_App/model/newsmodel.dart';



class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];

  String category = "business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsApp newsModel;
  bool isLoading = false;
  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d0afd1b4a9754848ae0a1122c900f6c7");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsApp.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
