import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_moviedb/data/api_calls.dart';
import 'package:riverpod_moviedb/models/movie.dart';
import 'package:riverpod_moviedb/size_onfig.dart';

class CustomCard extends StatefulWidget {
  final List<Movie> movies;

  const CustomCard({Key key, this.movies}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  CarouselController sliderController;

  int pageIndex;

  @override
  void initState() {
    super.initState();
    sliderController = CarouselController();
    pageIndex = 0;
    // ini();
  }

  ini() async {
    var test = await ApiCall().getMovieData('batman');
    Movie m = Movie.fromJson(test);
    widget.movies.add(m);
    test = await ApiCall().getMovieData('superman');
    m = Movie.fromJson(test);
    widget.movies.add(m);
    test = await ApiCall().getMovieData('spiderman');
    m = Movie.fromJson(test);
    widget.movies.add(m);
    setState(() {});
  }

  final SizeScaleConfig scaleConfig = SizeScaleConfig();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      // carouselController: sliderController,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        autoPlay: false,
        aspectRatio: 0.8,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        onPageChanged: (index, reason) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      items: widget.movies.map((item) {
        int _imageIndex = widget.movies.indexOf(item);
        bool _isCenterPage = pageIndex == _imageIndex;
        String _posterPath = item.poster;
        String _title = item.title;
        String _genres = (item.genre) ?? "";
        return Container(
          height: 600,
          child: Image.network(
            _posterPath,
            fit: BoxFit.cover,
            width: scaleConfig.scaleWidth(320),
            height: scaleConfig.scaleHeight(_isCenterPage ? 450 : 380),
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Container(
                padding: EdgeInsets.only(right: scaleConfig.scaleWidth(20)),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    //image
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        child: GestureDetector(
                          onTap: () async {
                            //allow to click only center page in recent section
                            if (_isCenterPage) {
                              print('Image clicked index : $_imageIndex');
                              // //Add this to Recently opened Movies Box of DB
                              // await RecentlyOpenedMoviesBox.addMovie(
                              //   MovieDataModel(
                              //     id: item.id,
                              //     title: item.title,
                              //     posterPath: item.posterPath,
                              //     genreIds: item.genreIds,
                              //     overview: item.overview,
                              //     bookmarked: false,
                              //     lastOpened: DateTime.now(),
                              //   ),
                              // );
                              // //
                              // navigatorKey.currentState.pushNamed(
                              //   MovieDetail.routeName,
                              //   arguments: MovieDetailArguments(
                              //     id: item.id ?? -1,
                              //     rating: item.voteAverage,
                              //     title: item.title ?? "",
                              //     genres: _genres,
                              //     moviePosterUrl: _posterPath,
                              //     movieOverview: item.overview ?? "",
                              //   ),
                              // );
                            }
                          },
                          child: child,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600].withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, _isCenterPage ? 10 : 0),
                          ),
                        ],
                      ),
                    ),
                    //Movie Title
                    Container(
                      padding: EdgeInsets.only(
                          top: scaleConfig.scaleHeight(15),
                          bottom: scaleConfig.scaleHeight(10)),
                      margin:
                          EdgeInsets.only(right: scaleConfig.scaleWidth(75)),
                      child: Text(
                        _title,
                        maxLines: 1,
                        style: TextStyle(
                          color:
                              _isCenterPage ? Colors.black : Colors.grey[700],
                          fontSize: (28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //Movie Tags
                    Container(
                      margin: EdgeInsets.only(right: (140)),
                      child: Text(
                        _genres,
                        maxLines: 2,
                        style: TextStyle(
                          color: _isCenterPage ? Colors.black45 : Colors.grey,
                          fontSize: (18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
