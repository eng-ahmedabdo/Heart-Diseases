
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LunchMeal3 extends StatelessWidget {
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 340,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage('assets/lunchMeal3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.5,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 61,
                width: double.infinity,
                color: Color(0xffE97777),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Lentil soup',
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans",
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w600
                        // fontWeight: FontWeight.w500,
                        //   letterSpacing: 0.60,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Ingredients('Baladi whole loaf'),
              SizedBox(
                height: 15,
              ),
              Ingredients('Lentil soup'),
              SizedBox(
                height: 15,
              ),
              Ingredients('Vegetables salad'),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Color(0xffDBDBDB),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/cup.png'),
                    backgroundColor: Color(0xffF5F5F5),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'A cup of green tea an hour after \nthe meal',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.60,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 83,
              ),
              Center(
                child: Container(
                  width: 134,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xff232b43),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Ingredients(String txt) {
  return Container(
    child: Row(
      children: [
        SizedBox(
          width: 28,
        ),
        Icon(
          Icons.circle,
          size: 7,
          color: Colors.black,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "IBM Plex Sans",
          ),
        )
      ],
    ),
  );
}
