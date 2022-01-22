import 'dart:async';
import 'package:flutter/material.dart';

import 'package:harios/ui/resources/colors.dart';
import 'package:harios/ui/screens/home.dart';

class ScaleAnimation extends StatefulWidget {
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}


class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  startTimer(){
    var duration = new Duration(seconds: 5);
    return new Timer(duration,navigatorPage);
  }

   navigatorPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, duration: Duration(seconds: 2,),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    );

    animationController.forward();
    startTimer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.8],
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
            AppColors.gradient3,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ScaleTransition(
            scale: animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Harios Salon',
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.white,
                    fontSize: 50.0,
                    shadows: [
                      Shadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      )
                    ],
                  ),
                ),
                Text(
                  'Salon at your home',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 25,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w300,
                  )
                )
              ],
            ),
          )
        )
      ),
    );
  }
}