import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim/features/HomeScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});


  @override
  State<Splashscreen> createState() => _SplashscreenState();
}


class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homescreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         /* Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
            ),
          ),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/core/svg/day_mode.svg',

              fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                  'Application Islamique',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: Colors.green,
              ),

            ],
          )
        ],

      ),


    );
  }
}
