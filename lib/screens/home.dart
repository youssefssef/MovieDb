import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesdb/Widget/movies_slider.dart';
import 'package:moviesdb/Widget/trending_movies.dart';

import '../Widget/background_movie.dart';
import '../Widget/menu.dart';
import '../api/api.dart';
import '../models/movies.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  late Future<List<Movie>> trendingMovies;

  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().fetchTrendingMovies();
    topRatedMovies = Api().fetchTopeRatedMovies();
    upComingMovies = Api().fetchUpComingMovies();
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
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Home',
                style: GoogleFonts.nosifer(
                  textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  zoomDrawerController.toggle!();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 45,
                )),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 380,
                      width: double.infinity,
                      child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()), //change to loading indicator
                              );
                            } else {
                              if (snapshot.hasData) {
                                return BackgroundMovies(
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
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        child: FutureBuilder(
                            future: trendingMovies,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()), //change to loading indicator
                                );
                              } else {
                                if (snapshot.hasData) {
                                  return TrendingMovies(
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
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Top rated Movies',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                      future: topRatedMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()), //change to loading indicator
                          );
                        } else {
                          if (snapshot.hasData) {
                            return MoviesSlider(
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Up Coming Movies',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  child: FutureBuilder(
                      future: upComingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()), //change to loading indicator
                          );
                        } else {
                          if (snapshot.hasData) {
                            return MoviesSlider(
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
              ],
            ),
          )),
    ));
  }
}
