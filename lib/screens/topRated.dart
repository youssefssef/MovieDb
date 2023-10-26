import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../Widget/menu.dart';
import '../Widget/moviesList.dart';
import '../api/api.dart';
import '../models/movies.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({
    super.key,
  });

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  late Future<List<Movie>> topRatedMovies;
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  void initState() {
    super.initState();
    topRatedMovies = Api().fetchTopeRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ZoomDrawer(
      menuScreen: const MenuPage(),
      controller: zoomDrawerController,
      menuBackgroundColor: const Color.fromARGB(255, 52, 51, 51),
      slideWidth: MediaQuery.of(context).size.width / 1.5,
      showShadow: true,
      angle: 0.0,
      style: DrawerStyle.defaultStyle,
      mainScreen: Scaffold(
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Top Rated Movies',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                zoomDrawerController.toggle!();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 35,
              )),
        ),
        body: SizedBox(
          child: FutureBuilder(
              future: topRatedMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()), //change to loading indicator
                  );
                } else {
                  if (snapshot.hasData) {
                    return MoviesList(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              }),
        ),
      ),
    ));
  }
}
