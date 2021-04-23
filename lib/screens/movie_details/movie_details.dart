import 'package:flutter/material.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/size_config.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails({Key key, this.movie}) : super(key: key);

  final SizeConfig scaleConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Background Image
        Container(
          height: SizeConfig.screenHeight * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(movie.poster),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [Colors.black.withOpacity(0.1), Color(0xff10111A)]),
          ),
        ),
        //Screen
        Scaffold(
          backgroundColor: Colors.transparent, //for BG image
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: SizeConfig().scaleHeight(380),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                          fontFamily: 'Orelega One',
                          color: Colors.white,
                          fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.plot,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Orelega One',
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),

        // Fixed bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 120,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(
                      fontFamily: 'Orelega One',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 30),
                ),
                Stack(
                  children: [
                    CircularProgressIndicator(
                      value: double.parse(movie.imdbRating) / 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, top: 8),
                      child: Text(
                        movie.imdbRating,
                        style: TextStyle(
                            fontFamily: 'Orelega One',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
