import 'package:flutter/material.dart';
import 'package:news_app/provider/theme_change_provider.dart';
import 'package:news_app/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
  );

  ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
  );

   bool iconBool = false;
  bool isDarkMode = false;
   IconData iconLight = Icons.wb_sunny;
   IconData iconDark = Icons.nights_stay;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ],
    child: Builder(
        builder: (BuildContext context){
          final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          // use for radio button
            themeMode:themeChanger.themeMode,
            // use for app bar
             theme: iconBool ? darkTheme:lightTheme,
           // use for switch
          // theme: ThemeData.light(),
          // darkTheme: ThemeData.dark(),
          // themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            // with radio button
            // theme: ThemeData(
            //   brightness: Brightness.light,
            //   primarySwatch: Colors.purple,
            // ),
            // darkTheme: ThemeData(
            //   brightness: Brightness.dark,
            //   primarySwatch: Colors.green,
            // ),
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                    setState(() {
                      iconBool = !iconBool;
                    });
                  },
                    icon: Icon(iconBool ?iconDark : iconLight ),),
                ],
              ),
              body: HomePage(),
            ),

            debugShowCheckedModeBanner: false,
          );
        }
    ),
    );
  }
}


