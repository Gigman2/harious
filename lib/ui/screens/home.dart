import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harios/ui/resources/colors.dart';
import 'package:harios/ui/resources/icons.dart';

import 'package:harios/ui/screens/appointment.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

get _homeAppbar {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Text(
      "Harios Salon",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontFamily: 'Lobster',
        fontSize: 30,
        shadows: [
          Shadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: SvgPicture.string(
              bellIcon,
              allowDrawingOutsideViewBox: true,
            )
        )
      ),
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child:  SvgPicture.string(
              cartIcon,
              allowDrawingOutsideViewBox: true,
            ),
        )
      ),
    ],
  );
}

Widget _services({List items}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _service(
        icon: items[0][0],
        label: items[0][1]

      ),
      _service(
        icon: items[1][0],
        label: items[1][1]
      )
    ],
  );
}

Widget _service({String icon, String label, VoidCallback ontap}) {
  return Container(
    height: 120,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17.0),
      boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6.0, // soften the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              3.0, // Move to bottom 10 Vertically
            ),
          )
        ],
    ),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 60,
            height: 50,
            child: SvgPicture.string(
              icon,
              fit: BoxFit.contain,
              color: AppColors.primaryColor,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 19,
            color: AppColors.secondaryColor
          ),
        )
      ],
    ),
  );
}

get _promoBanner {
  return Padding(
    padding: EdgeInsets.all(25),
    child: Container(
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Invite your friends',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 200,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        'Get up to 10% Discount',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 17,
                          color: AppColors.primaryColor
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  // Text('Invite your friends')
                ],
              )
            )
          ],
        ),
      )
    ),
  );
}

Widget _floatingButton({BuildContext context}) {
  return  FloatingActionButton(
    onPressed: () { 
      Navigator.push( context,
        MaterialPageRoute(builder: (context) => Appointment()),
      );
    },
    tooltip: 'Add Appointment',
    child: SvgPicture.string(
      plusIcon,
    ),
    backgroundColor: AppColors.primaryColor,
    elevation: 2.0,
  );
}

get _bottomBar{
  return BottomAppBar(
    child: Container(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 4.0, color: AppColors.primaryColor)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SvgPicture.string(
                homeIcon,
                fit: BoxFit.contain,
                color: AppColors.primaryColor,
              ),
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
            width: 50,
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



class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _homeAppbar,
        body: Column(
          children: <Widget>[
            _promoBanner,
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: _services(items: [[nailsIcon, 'Nails'], [manicureIcon, 'Manicure']])
            ),
             Padding(
              padding: const EdgeInsets.only(top:25.0, left: 25, right: 25),
              child: _services(items: [[pedicureIcon, 'Pedicure'], [makeupIcon, 'Makeup']])
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: _floatingButton(context: context),
        bottomNavigationBar: _bottomBar,
      )
    );
  }
}