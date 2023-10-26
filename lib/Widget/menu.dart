import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesdb/screens/home.dart';

import '../screens/topRated.dart';
import '../screens/trending.dart';
import '../screens/upComing.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
            Color.fromARGB(255, 19, 19, 19),
            Color.fromARGB(255, 52, 51, 51),
          ])),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0, left: 25),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Movies ',
                        style: GoogleFonts.kanit(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set color for the word "Movies"
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'DB',
                        style: GoogleFonts.kanit(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red, // Set color for the word "Db"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 78.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreeen()));
                  },
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: const Icon(
                  Icons.trending_up,
                  color: Colors.white,
                ),
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Trending ', style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TrendingMoviesScreen()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Top Rated ', style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TopRatedScreen()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.upcoming,
                  color: Colors.white,
                ),
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Up Coming', style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UpComingMoviesScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
