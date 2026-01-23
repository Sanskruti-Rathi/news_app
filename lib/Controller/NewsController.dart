import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/NewsModel.dart';

class NewsController extends GetxController {

  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> apple5News = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> tesla5News = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> business5News = <NewsModel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isBusinessLoading = false.obs;



  void onInit()async{
    super.onInit();
    getNewsForYou();
    getTrendingNews();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }




  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseURL = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=07d475f008ae4c7e80d1782fa234bb99";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isTrendingLoading.value = false;
  }
  Future<void> getNewsForYou() async {
    isNewsForULoading.value = true;
  var baseURL = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=07d475f008ae4c7e80d1782fa234bb99";
  try {
    var response = await http.get(Uri.parse(baseURL));
    print(response);
    if (response.statusCode == 200) {
      print(response.body);
      var body = jsonDecode(response.body);
      var articles = body["articles"];
      for (var news in articles) {
        newsForYouList.add(NewsModel.fromJson(news));
       }
       newsForYou5.value = newsForYouList.sublist(0,5).obs;
    } else {
      print("Something went wrong in trending news");
     }
  } catch (ex) {
    print(ex);
    }
    isNewsForULoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=apple&from=2026-01-22&to=2026-01-22&sortBy=popularity&apiKey=07d475f008ae4c7e80d1782fa234bb99";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        apple5News.value = appleNewsList.sublist(0,5).obs;
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isAppleLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2025-12-23&sortBy=publishedAt&apiKey=07d475f008ae4c7e80d1782fa234bb99";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        tesla5News.value = teslaNewsList.sublist(0,5).obs;
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isTeslaLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessLoading.value = true;
    var baseURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=07d475f008ae4c7e80d1782fa234bb99";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          businessNewsList.add(NewsModel.fromJson(news));
        }
        business5News.value = businessNewsList.sublist(0,5).obs;
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isBusinessLoading.value = false;
  }

  Future<void> searchNews(String search) async{
    isNewsForULoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=$search&apiKey=07d475f008ae4c7e80d1782fa234bb99";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        newsForYouList.clear();
        int i=0;
        for (var news in articles) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (i==10){
            break;
          }
        }
      } else {
        print("Something went wrong in trending news");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForULoading.value = false;
  }


}
