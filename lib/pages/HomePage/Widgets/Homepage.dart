import 'package:flutter/material.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/pages/HomePage/Widgets/TrendingCard.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NEWSEE",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),

      floatingActionButton: MyBottomNav(),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                child: Row(
                  children:  [
                    TrendingCard(
                      imageUrl: "https://akm-img-a-in.tosshub.com/aajtak/images/story/202512/694d3ac18046d-indian-football-team-252307391-16x9.jpg?size=948:533" ,
                      title: "भारतीय फुटबॉल के लिए मायूसी भरा 2025",
                      author: "Nitish Kumar",
                      tag: "Trending no 1",
                      time: "2 day ago",
                    ),
                    TrendingCard(
                      imageUrl: "https://akm-img-a-in.tosshub.com/aajtak/images/breaking_news/202601/696997e3b8bd0-maharashtra-municipal-corporation-election-results-164357872-16x9.jpg?size=900:504" ,
                      title: "NDA's Track Record Struck A Chord",
                      author: "Nitish Kumar",
                      tag: "Trending no 2",
                      time: "2 day ago",
                    ),
                    TrendingCard(
                      imageUrl: "https://akm-img-a-in.tosshub.com/aajtak/images/story/202601/696a5e3b4cefb-deepika-padukone-ranveer-singh-dua-165013206-16x9.jpg?size=948:533" ,
                      title: "1300 करोड़ पार हुई रणवीर सिंह की 'धुरंधर', बेटी दुआ के आने से बदली एक्टर की किस्मत!",
                      author: "Nitish Kumar",
                      tag: "Trending no 3",
                      time: "2 day ago",
                    ),
          
          
                  ],
                ),
              ),
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
              SizedBox(height: 20,),
              Column(
                children: [
                  NewsTile(imageUrl: "https://akm-img-a-in.tosshub.com/aajtak/images/breaking_news/202601/696997e3b8bd0-maharashtra-municipal-corporation-election-results-164357872-16x9.jpg?size=900:504" ,
                    title: "NDA's Track Record Struck A Chord",
                    author: "Nitish Kumar",
                    time: "2 day ago",),
                  NewsTile(imageUrl: "https://akm-img-a-in.tosshub.com/aajtak/images/story/202512/694d3ac18046d-indian-football-team-252307391-16x9.jpg?size=948:533" ,
                    title: "भारतीय फुटबॉल के लिए मायूसी भरा 2025",
                    author: "Nitish Kumar",
                    time: "2 day ago",),
                  NewsTile(imageUrl: "https://akm-img-a-in.tosshub.com/aajtak/images/story/202601/696a5e3b4cefb-deepika-padukone-ranveer-singh-dua-165013206-16x9.jpg?size=948:533" ,
                    title: "1300 करोड़ पार हुई रणवीर सिंह की 'धुरंधर', बेटी दुआ के आने से बदली एक्टर की किस्मत!",
                    author: "Nitish Kumar",
                    time: "2 day ago",)
                ],
              )
          
            ],
          
          ),
        ),
      ),
    );
  }
}