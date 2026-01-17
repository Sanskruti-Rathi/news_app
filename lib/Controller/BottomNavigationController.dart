import 'package:get/get.dart';
import 'package:news_app/pages/HomePage/Widgets/ArticlePage/ArticalPage.dart';
import 'package:news_app/pages/HomePage/Widgets/Homepage.dart';
import 'package:news_app/pages/HomePage/Widgets/ProfilePage/ProfilePage.dart';

class BottomNavController extends GetxController{

   RxInt index=0.obs;

   var pages=[
      HomePage(),
      ArticalPage(),
      ProfilePage(),
   ];

}