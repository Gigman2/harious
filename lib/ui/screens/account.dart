
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harios/ui/resources/colors.dart';
import 'package:harios/ui/resources/icons.dart';

import 'package:harios/ui/screens/appointment.dart';

get _bottomBar{
  return BottomAppBar(
    child: Container(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 70,
            // height: 60,
            decoration: BoxDecoration(
              
            ),
            child: SvgPicture.string(
              homeIcon,
              fit: BoxFit.contain,
              color: AppColors.textColor,
            ),
          ),
           Container(
            width: 70,
            // height: 60,
            child: SvgPicture.string(
              userIcon,
              color: AppColors.textColor,
            ),
          ),
           Container(
            width: 70,
            // height: 60,
            child: SvgPicture.string(
              registerIcon,
              color: AppColors.textColor,
            ),
          ),
           Container(
            width: 60,
            height: 60,
          ),
        ],
      ),
    ),
    shape: CircularNotchedRectangle(),
    // color: Colors.blueGrey
  );
}


Widget _customAppBar({BuildContext context}) {
  return Container(
    height: 65,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: AppColors.secondaryColor
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: SvgPicture.string(
              backIcon
            ),
            onTap: () {
              
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
              "Appointment",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
            ),
        ),
      ],
    ),
  );
}

Widget _floatingButton({BuildContext context}) {
  return  FloatingActionButton(
    onPressed: () { 
      // Navigator.push( context,
      //   MaterialPageRoute(builder: (context) => SecondRoute()),
      // );
    },
    tooltip: 'Add Appointment',
    child: SvgPicture.string(
      thumbIcon,
      width: 30,
      color:  Colors.white,
    ),
    backgroundColor: AppColors.primaryColor,
    elevation: 2.0,
  );
}

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            _customAppBar(context: context)
           
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: _floatingButton(context: context),
        bottomNavigationBar: _bottomBar,
      )
    );
  }
}