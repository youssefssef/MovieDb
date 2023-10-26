import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class BackgroundMovies extends StatelessWidget {
  const BackgroundMovies({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider.builder(
            itemCount: snapshot.data!.length,
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return Stack(children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                      filterQuality: FilterQuality.high, fit: BoxFit.cover, '${Constants.imagePath}${snapshot.data[itemIndex].posterpath}'),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust sigmaX and sigmaY for the blur intensity
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ]);
            }));
  }
}
