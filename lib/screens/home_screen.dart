import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_moviedb/providers/providers.dart';
import 'package:riverpod_moviedb/screens/common_widgets/custom_card.dart';
import 'package:riverpod_moviedb/size_onfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpen = false;
  TextEditingController _searchController = TextEditingController();
  @override
  void didChangeDependencies() {
    SizeScaleConfig().calculateScaleRatios(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: (isOpen)
            ? Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Search movies...'),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          context
                              .read(homeScreenProvider.notifier)
                              .getMovieData(_searchController.text);
                        })
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
              )
            : Text(
                'Movies App',
                style: TextStyle(color: Colors.black),
              ),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isOpen = !isOpen;
                });
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Recents',
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ))
                ],
              ),
              SizedBox(height: 20),
              Consumer(builder: (context, watch, _) {
                return watch(homeScreenProvider).when(
                    data: (data) => Column(
                          children: [
                            (data.isEmpty)
                                ? Center(
                                    child: Text('Search movies'),
                                  )
                                : CustomCard(
                                    movies: data,
                                  ),
                          ],
                        ),
                    loading: () => Container(),
                    error: (e, s) => Container());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
