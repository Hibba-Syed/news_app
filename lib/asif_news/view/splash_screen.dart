import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer( Duration(seconds: 2),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * .1,),
            Image.asset('assets/image/splash_pic.jpg',
              fit: BoxFit.cover,
              height: height *.5,
            ),
            SizedBox(height: height * .1,),
             Text('Top HeadLines',style: GoogleFonts.anton(letterSpacing: .6,color: Colors.green),),
            SizedBox(height: height * .1,),
            const SpinKitChasingDots(
              color: Colors.green,
              size: 40,

            ),
          ],
        ),
      ),
    );
  }
}
