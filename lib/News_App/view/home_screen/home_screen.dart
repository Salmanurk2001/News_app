import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_project/News_App/controller/home_screen.dart';
import 'package:new_project/News_App/view/search_screen/search_screen.dart';
import 'package:new_project/News_App/view/widget/news_card.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()  {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6A3DE8),
        elevation: 0,
        title: const Text(
          "News Today 🗞️",
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20,
            fontWeight: FontWeight.w600),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Provider.of<HomeScreenController>(context).isLoading == true
          ? Center(
          child: LottieBuilder.asset(
            "assets/animations/Animation - 1702395258490 (2).json",
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ))
          : Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) => NewsCard(
              title: provider.newsModel.articles?[index].title
                  .toString() ?? "",
              description: provider
                  .newsModel.articles?[index].description
                  .toString() ??
                  "",
              date: provider.newsModel.articles?[index].publishedAt,
              imageUrl: provider.newsModel.articles?[index].urlToImage
                  .toString() ??
                  "",
              contant: provider.newsModel.articles?[index].content
                  .toString() ??
                  "",
              sourceName: provider
                  .newsModel.articles?[index].source?.name
                  .toString() ??
                  "",
              url: provider.newsModel.articles?[index].url
                  .toString() ??
                  "",
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 20,
            ),
            itemCount: provider.newsModel.articles?.length ?? 0),
      ),
    );
  }
}
