import 'package:flutter/material.dart';
import 'package:moviesdb/models/movies.dart';

import '../Widget/constants.dart';
import '../Widget/wavePoster.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 25, 25),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 450,
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                            filterQuality: FilterQuality.high, fit: BoxFit.cover, '${Constants.imagePath}${movie.backDropPath}'),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        child: SizedBox(
                          height: 240,
                          width: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                  filterQuality: FilterQuality.high, fit: BoxFit.cover, '${Constants.imagePath}${movie.posterpath}')),
                        )),
                    Positioned(
                      bottom: 140,
                      left: 180,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          movie.title,
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 100,
                        left: 180,
                        child: Row(
                          children: [
                            Text(
                              movie.voteAvarege.toStringAsFixed(1),
                              style: const TextStyle(color: Color.fromARGB(255, 200, 95, 87), fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 30), // Add some space between the number and stars
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color:
                                      (movie.voteAvarege / 2) > index ? Colors.orange : Colors.grey, // Show full stars based on the rating
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )),
                    const Positioned(
                        bottom: 60,
                        left: 180,
                        child: Row(
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(color: Color.fromARGB(255, 165, 164, 164), fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Grades',
                              style: TextStyle(color: Color.fromARGB(255, 162, 162, 162), fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20),
                child: Text(
                  ' Story Line',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 114, 113, 113), fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25, right: 20),
                child: Text(
                  movie.overview,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, height: 1.8),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20),
                child: Text(
                  ' Release Date : ',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 123, 123, 123), fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25, right: 20),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: Colors.white)),
                  child: Text(
                    movie.releaseDate,
                    style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
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
