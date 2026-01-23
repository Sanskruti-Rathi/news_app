import 'package:flutter/material.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/pages/HomePage/Widgets/ArticlePage/Widgets/SearchWidget.dart';
import 'package:news_app/pages/HomePage/Widgets/NewsDetails/NewsDetails.dart';
import 'package:news_app/pages/HomePage/Widgets/NewsTile.dart';
import 'package:get/get.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
             Searchwidget(),
              SizedBox(height: 20),
              Obx(
                      () => Column(
                        children: newsController.newsForYouList.map((e)=>NewsTile(
                          ontap: (){
                            Get.to(NewsDetailsPage(news: e));
                          },
                          imageUrl:
                          e.urlToImage ??
                              "https://akm-img-a-in.tosshub.com/aajtak/images/breaking_news/202601/696997e3b8bd0-maharashtra-municipal-corporation-election-results-164357872-16x9.jpg?size=900:504" ,
                          title: e.title!  ,
                          author: e.author ?? "Unknown",
                          time: e.publishedAt!,
                        ),).toList(),



                      ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
