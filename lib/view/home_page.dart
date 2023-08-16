import 'package:flutter/material.dart';
import 'package:news_app/model/newsModel.dart';
import '../service/fetch_news.dart';
import '../widget/news_container.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
 late NewsModel newsModel;
 GetNews() async{
   newsModel = await FetchNews.fetchNews();
   setState(() {
     isLoading = false;
   });
 }
  @override
  void initState() {
    GetNews();
    super.initState();
  }

  // use for switch
 //  bool isDarkMode = false ;

  // void toggleThemeMode(bool newValue) {
  //   setState(() {
  //     isDarkMode = newValue;
  //   });
  // }
  //ends here switch
    @override
    Widget build(BuildContext context) {
     // final themeChanger = Provider.of<ThemeChanger>(context);
      return Scaffold(
        body: PageView.builder(
            controller: PageController(initialPage: 0),
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
              //  isLoading = true;
              });
              GetNews();
            },
            itemBuilder: (context, index) {
              return isLoading ? const Center(child: CircularProgressIndicator(),) : NewsContainer(
                  imgUrl: newsModel.imgUrl,
                  newsCnt: newsModel.newsCnt,
                  newsHead: newsModel.newsHead,
                  newsDes: newsModel.newsDes,
                  newsUrl: newsModel.newsUrl
                  );
            }),

      );

  }
}

// RadioListTile<ThemeMode>(
// title: const Text("Light"),
// value: ThemeMode.light,
// groupValue: themeChanger.themeMode,
// onChanged: themeChanger.setTheme
// ),
// RadioListTile<ThemeMode>(
// title: const Text("Dark"),
// value: ThemeMode.dark,
// groupValue: themeChanger.themeMode,
// onChanged: themeChanger.setTheme
// ),
// OutlinedButton(
// onPressed: () {
// },
// child: const Text("Click"),
// ),
// // Switch(
// //     value: isDarkMode ,
// //     onChanged: toggleThemeMode,
// // ),