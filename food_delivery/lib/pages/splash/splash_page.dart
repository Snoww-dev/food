import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/routes/routes_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) :super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2))..forward();
      
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear);

    Timer(
      Duration(seconds: 3),
      ()=> Get.offNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/image/logo1.png", width: 250,))),
          Center(child: Image.asset("assets/image/logo2.png", width: 250,)),
        ],
      ),
    );
  }
}