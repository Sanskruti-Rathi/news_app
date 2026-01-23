import 'package:flutter/material.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Components/NewsTileLoading.dart';
import 'package:news_app/Components/TrendingLoadingCard.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/pages/HomePage/Widgets/NewsDetails/NewsDetails.dart';
import 'package:news_app/pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/pages/HomePage/Widgets/TrendingCard.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:Icon(Icons.dashboard),
                  ),
                  Text("NEWS APP",style: TextStyle(fontSize: 25,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                  ),

                  InkWell(
                    onTap: (){
                      newsController.getNewsForYou();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child:Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
          
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                      () => newsController.isTrendingLoading.value
                          ? Row(children: [
                            TrendingLoadingCard(),
                            TrendingLoadingCard(),

                            ],)
                         : Row(
                        children: newsController.trendingNewsList
                            .map((e) => TrendingCard(
                          ontap: () {
                            Get.to(NewsDetailsPage(
                              news: e,
                            ));
                          },
                          imageUrl: e.urlToImage ?? "",
                          title: e.title ?? "",
                          author: e.author ?? "Unknown",
                          tag: "Trending no 1",
                          time: e.publishedAt ?? "",
                        ))
                            .toList(),
                      ),

              )),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () => newsController.isNewsForULoading.value
                        ? Column(
                      children: [
                        NewsTileLoading(),
                        NewsTileLoading(),
                        NewsTileLoading(),
                      ],
                    )
                        :Column(
                          children: newsController.newsForYou5
                          .map(
                            (e) => NewsTile(
                          ontap: (){
                            Get.to(NewsDetailsPage(news: e));
                          },
                          imageUrl: e.urlToImage ??
                              "https://akm-img-a-in.tosshub.com/aajtak/images/story/202601/697234675edae-bombay-high-court-222953518-16x9.jpeg?size=948:533",
                          title: e.title ?? "No title",
                          author: e.author ?? "Unknown",
                          time: e.publishedAt ?? "",
                        ),
                      )
                          .toList(),
                    ),
              ),
              SizedBox(height: 20 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () => newsController.isTeslaLoading.value
                    ? Column(
                      children: [
                        NewsTileLoading(),
                        NewsTileLoading(),
                        NewsTileLoading(),
                      ],
                    )
                    :Column(
                  children: newsController.tesla5News
                      .map(
                        (e) => NewsTile(
                      ontap: (){
                        Get.to(NewsDetailsPage(news: e));
                      },
                      imageUrl: e.urlToImage ??
                          "https://akm-img-a-in.tosshub.com/aajtak/images/story/202601/697234675edae-bombay-high-court-222953518-16x9.jpeg?size=948:533",
                      title: e.title ?? "No title",
                      author: e.author ?? "Unknown",
                      time: e.publishedAt ?? "",
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(height: 20 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                        () => newsController.isAppleLoading.value
                        ? Row(children: [
                          TrendingLoadingCard(),
                          TrendingLoadingCard(),

                        ],)
                        : Row(
                      children: newsController.apple5News
                          .map((e) => TrendingCard(
                        ontap: () {
                          Get.to(NewsDetailsPage(
                            news: e,
                          ));
                        },
                        imageUrl: e.urlToImage ?? "",
                        title: e.title ?? "",
                        author: e.author ?? "Unknown",
                        tag: "Trending no 1",
                        time: e.publishedAt ?? "",
                      ))
                          .toList(),
                    ),

                  )),
              SizedBox(height: 20 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () => newsController.isBusinessLoading.value
                    ? Column(
                      children: [
                        NewsTileLoading(),
                        NewsTileLoading(),
                        NewsTileLoading(),
                      ],
                    )
                    :Column(
                  children: newsController.business5News
                      .map(
                        (e) => NewsTile(
                      ontap: (){
                        Get.to(NewsDetailsPage(news: e));
                      },
                      imageUrl: e.urlToImage ??
                          "https://akm-img-a-in.tosshub.com/aajtak/images/story/202601/697234675edae-bombay-high-court-222953518-16x9.jpeg?size=948:533",
                      title: e.title ?? "No title",
                      author: e.author ?? "Unknown",
                      time: e.publishedAt ?? "",
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}