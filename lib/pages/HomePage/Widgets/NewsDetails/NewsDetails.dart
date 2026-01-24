import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Controller/NewsController.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailsPage({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios_new),
                              Text("Back"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      news.urlToImage ?? "https://akm-img-a-in.tosshub.com/aajtak/images/story/202512/694d3ac18046d-indian-football-team-252307391-16x9.jpg?size=948:533",
                      height: 330,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(news.title!,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(
                    height: 10
                  ),
                  Row(
                    children: [
                      Text("${news.author} * ${news.publishedAt}",
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                        child: Text(
                          (news.author != null && news.author!.isNotEmpty)
                              ? news.author![0]
                              : "?",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        news.author ?? "Unknown",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height: 30,
                    child: Row(
                      children: [
                        Obx(
                              () => newsController.isSpeeking.value
                              ? IconButton(
                            onPressed: () {
                              newsController.stop();
                            },
                            icon: Icon(
                              Icons.stop,
                              size: 50,
                            ),
                          )
                              : IconButton(
                            onPressed: () {
                              newsController.speak(
                                  news.description ?? "No Description");
                            },
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              size: 50,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Obx(
                                  () => Lottie.asset(
                                'assets/animation/wave.json',
                                height: 70,
                                animate: newsController.isSpeeking.value,
                              ),
                            ))

                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          news.description ?? "No Description",
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}