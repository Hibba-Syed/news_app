import 'package:flutter/material.dart';
import 'package:news_app/controller/fetch_news.dart';
import 'package:news_app/main.dart';
import 'package:provider/provider.dart';
import '../provider/theme_change_provider.dart';
import '../widget/news_container.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FetchNews.fetchNews();
    super.initState();
  }

  // use for app bar
  bool iconBool = false;
  IconData iconLight = Icons.wb_sunny;
  IconData iconDark = Icons.nights_stay;

// end here for app bar
  // use for switch
  bool isDarkMode = false;

  void toggleThemeMode(bool newValue) {
    setState(() {
      isDarkMode = newValue;
    });
  }
  //ends here switch
    @override
    Widget build(BuildContext context) {
      final themeChanger = Provider.of<ThemeChanger>(context);
      return PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  NewsContainer(
                    imgUrl: 'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                    newsDes: 'An official document of the Ministry of Information and Telecommunication (MOITT) has detailed that the government is planning to launch 5G in Pakistan by 2023. The launch will start with the three big cities of the country including Islamabad, Karachi, and Lahore.',
                    newsHead: '5G In Pakistan',
                    newsUrl: 'https://www.google.com/search?q=5g+in+pakistan&',
                  ),
                  RadioListTile<ThemeMode>(
                      title: const Text("Light"),
                      value: ThemeMode.light,
                      groupValue: themeChanger.themeMode,
                      onChanged: themeChanger.setTheme
                  ),
                  RadioListTile<ThemeMode>(
                      title: const Text("Dark"),
                      value: ThemeMode.dark,
                      groupValue: themeChanger.themeMode,
                      onChanged: themeChanger.setTheme
                  ),
                  Switch(
                      value: isDarkMode ,
                      onChanged: toggleThemeMode,
                  ),
                ],
              ),
            );
          }
      );
    }
  }
