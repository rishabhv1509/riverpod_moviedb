import 'package:flutter/material.dart';
import 'package:riverpod_moviedb/size_config.dart';

class CustomBottomSheet extends StatelessWidget {
  final double rating;
  final SizeConfig scaleConfig = SizeConfig();

  CustomBottomSheet({Key key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleConfig.scaleWidth(120),
      color: Colors.white,
      child: Material(
        child: Container(
          margin: EdgeInsets.only(
            left: scaleConfig.scaleWidth(40),
            right: scaleConfig.scaleWidth(30),
            top: scaleConfig.scaleWidth(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: scaleConfig.scaleWidth(65),
                width: scaleConfig.scaleWidth(240),
                margin: EdgeInsets.only(
                  left: scaleConfig.scaleWidth(10),
                  right: scaleConfig.scaleWidth(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    print('Pressed onTap of movie bottom button');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 0,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "RATE MOVIE",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: scaleConfig.scaleWidth(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: scaleConfig.scaleWidth(20),
                    right: scaleConfig.scaleWidth(15)),
                child: Stack(
                  children: [
                    SizedBox(
                      height: scaleConfig.scaleWidth(60),
                      width: scaleConfig.scaleWidth(60),
                      child: CircularProgressIndicator(
                        value: 54 / 10,
                        strokeWidth: 2,
                        // valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: Text(
                          "9.1",
                          // rating.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: scaleConfig.scaleWidth(20),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
